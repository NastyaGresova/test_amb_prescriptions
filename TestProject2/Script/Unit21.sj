function Test21_new()      // правильность отображения мнн в рецепте
{
  var w0=Sys.Process("Automedi"); 
  w0.VCLObject("AMMain").VCLObject("bNewEditCons").Click();
    w0.VCLObject("fNewCons").VCLObject("PageControl2").VCLObject("MainTabSheet").VCLObject("BasePanel").VCLObject("TypeRecPanel").Window("TPanel", "", 1).VCLObject("lbModels").VScroll.Pos = 0;
    w0.VCLObject("fNewCons").VCLObject("PageControl2").VCLObject("MainTabSheet").VCLObject("BasePanel").VCLObject("TypeRecPanel").Window("TPanel", "", 1).VCLObject("lbModels").Keys(Runner.CallMethod("Unit_var.return_name_motconsu")); 
    w0.VCLObject("fNewCons").VCLObject("Panel1").VCLObject("Panel2").VCLObject("BitBtn1").Click();
    if (w0.Window("TMessageForm", "Подтверждение", 1) !== false)
    {
         w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("No").Click();
    }  
    delay(23000)
    w0.VCLObject("AMMain").VCLObject("TSpeedButton_5").Click(); 

    //вышла на форму с амбулаторными назначениями          
    delay(5000);
    
  max_height = w0.VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Max; 
  height=w0.VCLObject("AMMain").VCLObject("pResume").Height
  Runner.CallMethod("Unit_var.find_amb_prescriptions",height, max_height);  
  
  //w1 - объект "амбулаторные назначения"
  var w1 = Runner.CallMethod("Unit_var.return_w1"); 
    
  // грид: 
  w_grid = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid");
  w_grid.VScroll.Pos=1;
  delay(2000);
  
  //нужно сперва создать назначение:
  w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("edMed").Click();
  delay(1000);
  w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("memComment").Click();  
  w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("edMed").Click();
  delay(2000);
  
  // w2 - глоссарий справа
  Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").Refresh();
 // Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("PanelGlossDrug").Refresh(); 
  var w2 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").PanelGlossDrug.VCLObject("pcDrugs");//Runner.CallMethod("Unit_var.return_w2"); 
  w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("tbICD").Click(40, 16);
  w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 3).Keys(Runner.CallMethod("Unit_var.return_pr_drugs_id_composite_mnn"));
    
  delay(2000);
  w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("tbAddDrug").Click();   
  Runner.CallMethod("Unit_var.close_confirmation_window", w0);
 
  Runner.CallMethod("Unit_var.intake", w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1"), Runner.CallMethod("Unit_var.intake_method_i"));
  delay(1000); 
  w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("btnAddDrugPrescr").Click();
  delay(2000);
   
  
  // w_recipe - часть "рецепты"
  w_recipe = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("RecipePanel").VCLObject("TabControl2")
  w_recipe.VCLObject("PanelRecipe").VCLObject("PatDocAmbRecipeForm").VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid").VScroll.Pos = 2;
  
  w_recipe.VCLObject("PanelRecipe").VCLObject("PatDocAmbRecipeForm").VCLObject("tbView").Click();
  w0.VCLObject("fmPRDrugsRecipeEdit").VCLObject("pRecord").VCLObject("DBEdit1").ClickR(10, 10); 
  w0.VCLObject("fmPRDrugsRecipeEdit").VCLObject("pRecord").VCLObject("DBEdit1").PopupMenu.Click("Выделить все"); 
  w0.VCLObject("fmPRDrugsRecipeEdit").VCLObject("pRecord").VCLObject("DBEdit1").ClickR(10, 10);
  w0.VCLObject("fmPRDrugsRecipeEdit").VCLObject("pRecord").VCLObject("DBEdit1").PopupMenu.Click("Копировать");
  w0.VCLObject("fmPRDrugsRecipeEdit").Close();
  var mnn_from_recipe = Sys.Clipboard; 
  
  var query =  "SELECT COALESCE(mnn1.RUSNAME, subs.RUSNAME, mnn2.RUSNAME) as NAME, mnns.FORDER, mnns.QUANTITY, me.LABEL, 1 as RUS FROM PR_DRUG_MNNS mnns LEFT JOIN PR_DRUG_SUBSTANCES subs ON mnns.PR_DRUG_SUBSTANCES_ID = subs.PR_DRUG_SUBSTANCES_ID LEFT JOIN CP_MNN mnn1 ON subs.CP_MNN_ID = mnn1.CP_MNN_ID LEFT JOIN CP_MNN mnn2 ON mnns.CP_MNN_ID = mnn2.CP_MNN_ID LEFT JOIN DM_MEASURE me on mnns.MEASURE_ID = me.DM_MEASURE_ID WHERE mnns.PR_DRUGS_ID =" + String(Runner.CallMethod("Unit_var.return_pr_drugs_id_composite_mnn"));
  
  RecSet = Runner.CallMethod("Unit_var.db_connection", query); 

  str=[]
  
  while (! RecSet.EOF )
  {
    curr_str=RecSet.Fields("NAME").Value+ " "+String(RecSet.Fields("QUANTITY"))+" " +RecSet.Fields("LABEL").Value ;
    str.push(curr_str);
    RecSet.MoveNext();
  }
  recept_mmn_db=''
  for (i = 0; i < str.length; i++)
  {
    if (i!=str.length-1)
    {
    recept_mmn_db=recept_mmn_db+str[i]+" + " ;
    }
    else 
    {
        recept_mmn_db=recept_mmn_db+str[i];
    }
  }
  
  if (recept_mmn_db==mnn_from_recipe)
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
        
        
        
        