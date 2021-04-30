--------------------------------------------------------
--  DDL for Trigger BIU_EBA_DEMO_FILE_PROJECTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BIU_EBA_DEMO_FILE_PROJECTS" 
   before insert or update on EBA_DEMO_FILE_PROJECTS
   for each row
begin
   if :new.ID is null then
     select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
   end if;
    -- Icon Validations
    -- Size (200KB limit)
    if updating and :NEW.ICON_NAME is not null and nvl(dbms_lob.getlength(:NEW.ICON_BLOB),0) > 204800 then
        raise_application_error(-20000, 'The size of the uploaded icon image was over 200kb. Please upload a smaller sized image.');
    end if;
    -- Mimetype (must be image)
    if (inserting or updating) and :NEW.ICON_NAME is not null and nvl(:NEW.ICON_MIMETYPE,'NULL') not like 'image%' then
       raise_application_error(-20000, 'The uploaded file was not an image. Please upload an image file.');
    end if;
   if inserting then
       :new.row_version_number := 1;
   elsif updating then
       :new.row_version_number := nvl(:old.row_version_number,1) + 1;
   end if;
end;

ALTER TRIGGER "BIU_EBA_DEMO_FILE_PROJECTS" ENABLE
