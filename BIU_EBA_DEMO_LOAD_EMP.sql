--------------------------------------------------------
--  DDL for Trigger BIU_EBA_DEMO_LOAD_EMP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BIU_EBA_DEMO_LOAD_EMP" 
    BEFORE INSERT OR UPDATE ON EBA_DEMO_LOAD_EMP
FOR EACH ROW
BEGIN
   if :new."CREATED" is null then
     select sysdate into :new.created from dual;
   end if;
   select sysdate into :new.last_updated from dual;
END;

ALTER TRIGGER "BIU_EBA_DEMO_LOAD_EMP" ENABLE
