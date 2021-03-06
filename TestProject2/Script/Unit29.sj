function Test29()  //  редактирование назначения: изменение единицы измерения
{  
    var w0=Sys.Process("Automedi"); 
    max_height = w0.VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Max;
    height=w0.VCLObject("AMMain").VCLObject("pResume").Height;
    Runner.CallMethod("Unit_var.find_amb_prescriptions",height, max_height); 
  
    var new_dm_measure="мг." 

    //w1 - объект "амбулаторные назначения"
    var w1 = Runner.CallMethod("Unit_var.return_w1");
  
    // грид: 
    w_grid = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid");
    w_grid.VScroll.Pos=1;
    delay(1000);
    
    //нужно сперва создать назначение:
    w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("edMed").Click();
    w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("memComment").Click();  
    w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("edMed").Click();
    delay(1000); 
    // w2 - глоссарий справа
    var w2 = Runner.CallMethod("Unit_var.return_w2"); 
    w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 3).Keys(Runner.CallMethod("Unit_var.pr_drugs_id"));
    delay(1000);
    w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("tbAddDrug").Click();   
    Runner.CallMethod("Unit_var.close_confirmation_window", w0);
    Runner.CallMethod("Unit_var.intake", w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1"), Runner.CallMethod("Unit_var.intake_method_i"));
    delay(1000); 
    w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("btnAddDrugPrescr").Click();
    delay(2000);
      
    w_grid.VScroll.Pos=2;
    delay(1000);
    w_grid.VScroll.Pos=3;
    delay(1000); 
    w_grid.VScroll.Pos=2;
    delay(1000); 
                  
    w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar").VCLObject("TToolButton_12").Click();
  
    // окно-редактор медикамента
    var w3 = Runner.CallMethod("Unit_var.return_w3");
    w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_2").VCLObject("pnHeader").VCLObject("pnPrMain").VCLObject("cbMU").ClickItem(new_dm_measure);
    w3.VCLObject("tbClose").Click();
    delay(5000);
    w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar").VCLObject("TToolButton_11").Click(); 
    delay(1500);
    if (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_2").VCLObject("pnHeader").VCLObject("pnPrMain").VCLObject("cbMU").wText == new_dm_measure)
    {
      Log.Message("ok #1")
    }
    w3.VCLObject("tbClose").Click(); 
    delay (2500);
       
      
    //дальше проверка что в схему в БД попало:   
    var query0 = "select top 1 * from PATDIREC where PATDIREC.PATIENTS_ID=" +String(Runner.CallMethod("Unit_var.patients_id"))+ " ORDER BY PATDIREC_ID DESC" 
  
    RecSet1 = Runner.CallMethod("Unit_var.db_connection", query0);
    var PATDIREC_ID = RecSet1.Fields("PATDIREC_ID").Value ; 
     
    var query = "DECLARE @PATDIREC_ID INT = " + String(PATDIREC_ID) + " declare @s_xml XML, @d_xml int; CREATE TABLE TABLEVARIABLE  (first nvarchar(100), second nvarchar(100)); set @s_xml = (select TEMPLATE_XML from patdirec where patdirec_id=@PATDIREC_ID); exec sp_xml_preparedocument @d_xml OUTPUT, @s_xml; INSERT INTO TABLEVARIABLE (first, second)  SELECT k AS PR_VAR_NAME, v AS PR_VAR_VALUE FROM OPENXML (@d_xml, '/config/TEMPLATE_NODE/PR_VAR_NODE') with (k nvarchar(100) 'PR_VAR_NAME', v nvarchar(100) 'PR_VAR_VALUE');"
    
    Runner.CallMethod("Unit_var.db_connection", query);
    var query1 = "select * from TABLEVARIABLE"
    RecSet = Runner.CallMethod("Unit_var.db_connection", query1); 
    while (! RecSet.EOF )
    {
      if (RecSet.Fields("second").Value == new_dm_measure)
      {
        Log.Message("ok#2");
      }
      RecSet.MoveNext();
    }
    var query2 = "drop table TABLEVARIABLE"
    Runner.CallMethod("Unit_var.db_connection", query2);
      
    
    // проверка, что в схемах на окне-редакторе единица измерения тоже изменилась 
    w_grid.VScroll.Pos=2;
    w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar").VCLObject("TToolButton_12").Click(); 
    delay(2000);
  
     //w_schemes - часть окна-редактора, где находятся схемы приемы:
    w_schemes = Sys.Process("Automedi").VCLObject("DirServEditor").VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_2").VCLObject("pnPrTemplate").VCLObject("sbTemplates");
    var current_scheme="fmPREmbeddedTemplate_" ;
    var i=1;
    var arr = [];
    var length_naznach=0; //количество схем в назначении
    while (w_schemes.WaitVCLObject((current_scheme + String(i)), 1000).Exists)
    {
         length_naznach = i;
         Log.Message(i);
         i++;    
    }
    for (var i=1; i<=length_naznach; i++)
    {
      if (w_schemes.VCLObject(current_scheme + String(i)).WaitVCLObject(("TLabel"), 1000).Exists && (w_schemes.VCLObject(current_scheme + String(i)).VCLObject("TLabel").Caption==new_dm_measure))
      {
        Log.Message("ok" + "схема № " + String(i));
        //Log.Message(Sys.Process("Automedi").VCLObject("DirServEditor").VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_2").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject(current_scheme + String(i)).VCLObject("TLabel").Caption);
      }
      var j=2;
      while (w_schemes.VCLObject(current_scheme + String(i)).WaitVCLObject(("TLabel_"+String(j)), 1000).Exists)
      {   
          if (w_schemes.VCLObject(current_scheme + String(i)).VCLObject("TLabel_"+String(j)).Caption==new_dm_measure) 
          {
            Log.Message("ok!!!  " + "схема № " + String(i));
            Log.Message((Sys.Process("Automedi").VCLObject("DirServEditor").VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_2").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject(current_scheme + String(i)).VCLObject("TLabel_"+String(j)).Caption));
          } 
          j++;
      }
    }   
    w3.VCLObject("tbClose").Click();
      
   // теперь нужно удалить назначение:
    w_grid.VScroll.Pos=2;
    delay(500);
    w_grid.VScroll.Pos=3;
    delay(500); 
    w_grid.VScroll.Pos=2;
    delay(500);
    w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar").VCLObject("TToolButton_13").Click();
    // подтверждение перед удалением:
    Sys.Process("Automedi").Window("TMessageForm", "Подтверждение", 1).VCLObject("Yes").Click();
    delay(2500);
    w_grid.VScroll.Pos=1;
    delay (2000);
}