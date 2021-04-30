--------------------------------------------------------
--  Ref Constraints for Table EBA_DEMO_FILES
--------------------------------------------------------

  ALTER TABLE "EBA_DEMO_FILES" ADD CONSTRAINT "EBA_DEMO_FILES_FK" FOREIGN KEY ("PROJECT_ID") REFERENCES "EBA_DEMO_FILE_PROJECTS" ("ID") ON DELETE CASCADE ENABLE
