function Test28()  //редактирование рецепта "количество отпускаемого препарата"
{  
  var w0=Sys.Process("Automedi"); 
  max_height = w0.VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Max;
  height=w0.VCLObject("AMMain").VCLObject("pResume").Height;
  Runner.CallMethod("Unit_var.find_amb_prescriptions",height, max_height); 

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
    
  //w_recipe - рецепты
  w_recipe = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("RecipePanel").VCLObject("TabControl2");
  w_recipe.VCLObject("PanelRecipe").VCLObject("PatDocAmbRecipeForm").VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid").VScroll.Pos = 2;
  w_recipe.VCLObject("PanelRecipe").VCLObject("PatDocAmbRecipeForm").VCLObject("tbEdit").Click();   
    
  //w_edit_recipe - окно-редактор рецепта
  w_edit_recipe = Sys.Process("Automedi").VCLObject("fmPRDrugsRecipeEdit");
  w_edit_recipe.VCLObject("pRecord").VCLObject("edDrugsAmount").Keys(Runner.CallMethod("Unit_var.return_drugs_amount_recipe"));
  w_edit_recipe.VCLObject("tbClose").Click();
  delay(1000);
       
  var query = "select top 1 * from PR_DRUGS_RECIPE JOIN patdirec on patdirec.patdirec_id=PR_DRUGS_RECIPE.patdirec_id where patdirec.PATIENTS_ID=" +String(Runner.CallMethod("Unit_var.patients_id"))+ "ORDER BY PR_DRUGS_RECIPE_ID DESC"
  RecSet = Runner.CallMethod("Unit_var.db_connection", query);
   
  if (RecSet.Fields("DRUGS_AMOUNT").Value == Runner.CallMethod("Unit_var.return_drugs_amount_recipe"))
  {
      Log.Message("YES");
  }
  else
  {
      Log.Message("NO");
  }
  
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
}