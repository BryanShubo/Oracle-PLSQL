RAISE vs RAISE_APPLICATION_ERROR?
 Steven Feuerstein
Follow Steven Feuerstein / 7.14.2010 at 9:01pm
A PL/SQL developer just sent me the following question:
"I can't understand the difference between RAISE_APPLICATION_ERROR and RAISE. Why would I use one vs. the other?"
Instead of answering via an email to just one developer, I thought I might share my answer with everyone.
 
The RAISE_APPLICATION_ERROR built-in (defined in the DBMS_STANDARD package) should be used for just a single scenario: you need to communicate an application-specific error back to the user.
 
Suppose, for example, I have a rule for the employees table that the minimum salary allowed is $100,000 (ah, wouldn't that be nice?). I want to enforce that rule through a database trigger:
TRIGGER employees_minsal_tr
   BEFORE INSERT OR UPDATE
   ON employees
   FOR EACH ROW
BEGIN
   IF :new.salary < 100000
   THEN
      /* communicate error */
      NULL;
   END IF;
END;
I can stop the DML from completing by issuing a RAISE statement, such as:

RAISE PROGRAM_ERROR;
But I would not be able to communicate back to the user what the actual problem was.
 
If, on the other hand, I use RAISE_APPLICATION_ERROR, I can specify the error number (of little interest to my users, but a good "identifier" for support) and, more importantly, the error message, as in:
TRIGGER employees_minsal_tr
   BEFORE INSERT OR UPDATE
   ON employees
   FOR EACH ROW
BEGIN
   IF :new.salary < 1000000
   THEN
      RAISE_APPLICATION_ERROR (-20000,
          'Salary of '|| :new.salary ||
          ' is too low. It must be at least $100,000.');
   END IF;
END; 
And that, dear reader, is the motivation for using RAISE_APPLICATION_ERROR: the ability to communicate a custom, application-specific error message to your users.
 
Use RAISE when you want to raise an already-defined exception, whether one of Oracle's (such as NO_DATA_FOUND) or one of your definition, as in:
DECLARE
   e_bad_value EXCEPTION;
BEGIN
   RAISE e_bad_value;
END; 
but if it is one of your own user-defined exceptions, it only makes sense to raise it this way if you are going to trap it inside the backend as well, and then do something in response to the error.
 
If you let the e_bad_value exception propagate out to your users, all they will know about the error is that the error code is 1 and the error message is "User-defined Exception". Not very helpful.
