--------------------------------------------------------
--  DDL for Trigger BIU_EBA_DEMO_FILES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BIU_EBA_DEMO_FILES" 
   before insert or update on EBA_DEMO_FILES
   for each row
begin
   if :new.ID is null then
     select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
   end if;
   if inserting then
       :new.created := localtimestamp;
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.updated := localtimestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.row_version_number := 1;
   elsif updating and :new.filename is not null and nvl(dbms_lob.getlength(:new.file_blob),0) > 15728640 then
       raise_application_error(-20000, 'The size of the uploaded file was over 15MB. Please upload a smaller sized file.');
   elsif updating then
       :new.row_version_number := nvl(:old.row_version_number,1) + 1;
   end if;
   if inserting or updating then
       :new.updated := localtimestamp;
       :new.updated_by := nvl(wwv_flow.g_user,user);
   end if;
end;

ALTER TRIGGER "BIU_EBA_DEMO_FILES" ENABLE
