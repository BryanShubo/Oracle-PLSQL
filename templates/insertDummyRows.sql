create or replace
PROCEDURE insertDummy
    IS
        CURSOR cMissing IS
            SELECT missing.app_ben_xref_id
            FROM (
                    SELECT
                        abx.app_ben_xref_id
                        FROM qdscore.applicant_benefit_xref  abx
                        WHERE uw_decision IS NOT NULL                   -- Exclude apps that have not reached a decision
                    MINUS
                        SELECT de.app_ben_xref_id
                        FROM reporting.dmf_extract de
                      ) missing
                      , qdscore.application  app
                      , qdscore.applicant_benefit_xref abx2
            WHERE app.application_id = abx2.application_id
                  and abx2.app_ben_xref_id = missing.app_ben_xref_id
            AND NVL(app.is_valid, 'Y') = 'Y';


        vCurrentApp NUMBER := NULL;
        l_instr    varchar2(4000);

    BEGIN
        FOR rMissing IN cMissing LOOP
        BEGIN
            vCurrentApp := rMissing.app_ben_xref_id;
            l_instr := 'insert into dmf_extract (APP_BEN_XREF_ID) values (:vCurrentApp)';
            execute immediate  l_instr using vCurrentApp;
            commit;
        END;
        END LOOP;
    END insertDummy;
