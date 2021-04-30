--------------------------------------------------------
--  Ref Constraints for Table EBA_DEMO_LOAD_EMP
--------------------------------------------------------

  ALTER TABLE "EBA_DEMO_LOAD_EMP" ADD FOREIGN KEY ("MGR") REFERENCES "EBA_DEMO_LOAD_EMP" ("EMPNO") ENABLE
  ALTER TABLE "EBA_DEMO_LOAD_EMP" ADD FOREIGN KEY ("DEPTNO") REFERENCES "EBA_DEMO_LOAD_DEPT" ("DEPTNO") ENABLE
