function Test7()     // открыть на просмотр назначение 
{

  var w0 = Sys.Process("Automedi");
  //w1 - объект "амбулаторные назначения"
  var w1 = Runner.CallMethod("Unit_var.return_w1");
  
  // грид: 
  w_grid = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid");
  w_grid.VScroll.Pos=1;
  delay(2000);
  
  
  //нужно сперва создать назначение:
  w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("edMed").Click();

  // w2 - глоссарий справа
  var w2 = Runner.CallMethod("Unit_var.return_w2"); 
  w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 3).Keys(Runner.CallMethod("Unit_var.pr_drugs_id"));
  delay(2000);
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
                  
  w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar").VCLObject("TToolButton_11").Click();

  // окно-редактор медикамента
  var w3 = Runner.CallMethod("Unit_var.return_w3");
  
  var query = "select top 1 * from PATDIREC_DRUGS order by patdirec_id desc"
  RecSet = Runner.CallMethod("Unit_var.db_connection", query); 
  DRUG_DESCR=RecSet.Fields("DRUG_DESCR")
  
  aqObject.CheckProperty(w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_1").VCLObject("pnHeader").VCLObject("pnPrMain").VCLObject("edMed"), "wText", 0, DRUG_DESCR);
    
  delay(1500);
  
  //удаление назначения  
  w3.Close();
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

}