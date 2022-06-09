function Test4()     // //создание составного назначения 
{
  var w0=Sys.Process("Automedi");    
  var pr_drugs_id_list = Runner.CallMethod("Unit_var.return_pr_drugs_id_list");  //id медикаментов, на основе которых делается составное назначение
  
  //w1 - объект "амбулаторные назначения"
  var w1 = Runner.CallMethod("Unit_var.return_w1");
  Runner.CallMethod("Unit_var.intake", w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1"), Runner.CallMethod("Unit_var.intake_method_i"));
  delay(1000);     
                      
  w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").ClickTab("Составные");  
    
  // грид: 
  w_grid = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid");
  w_grid.VScroll.Pos=1;
  
  for (var i = 0; i < pr_drugs_id_list.length; i++)
   { 
      w0.VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("PanelGlossDrug").VCLObject("pcDrugs").VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 3).Keys(pr_drugs_id_list[i]);
      //поле очищать надо после айдишника
      delay(2500) ;
      Runner.CallMethod("Unit_var.return_w2").VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("tbAddDrug").Click();
      Runner.CallMethod("Unit_var.close_confirmation_window", w0); 
      Runner.CallMethod("Unit_var.return_w2").VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 3).ClickR();
      Runner.CallMethod("Unit_var.return_w2").VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 3).PopupMenu.Click("Выделить все");
      Runner.CallMethod("Unit_var.return_w2").VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 3).ClickR(); 
      Runner.CallMethod("Unit_var.return_w2").VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 3).PopupMenu.Click("Удалить");
   }  
   Runner.CallMethod("Unit_var.return_w1").Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("btnAddDrugPrescr").Click();
   Runner.CallMethod("Unit_var.return_w1").Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").ClickTab("Простые"); 

  w_grid.VScroll.Pos=2;
  delay(1000);
  w_grid.VScroll.Pos=3;
  delay(1000); 
  w_grid.VScroll.Pos=2;
  delay(2000);

  w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar").VCLObject("TToolButton_13").Click();
  
  // подтверждение перед удалением:
  Sys.Process("Automedi").Window("TMessageForm", "Подтверждение", 1).VCLObject("Yes").Click();
  delay(5000);
  w_grid.VScroll.Pos=1;
}  