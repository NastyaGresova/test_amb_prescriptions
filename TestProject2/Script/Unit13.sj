function Test13()     // добавление схемы приема из типовых схем
{                  
    var w0 = Sys.Process("Automedi");
    //w1 - объект "амбулаторные назначения"
    var w1 = Runner.CallMethod("Unit_var.return_w1");
  
    // грид с назначениями: 
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
    
    //w_scheme поле для схемы приема
   // w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate").VCLObject("pnMain").VCLObject("pnLeft").VCLObject("pnTemplate").Window("TSpinEdit", "7", 1)
    w_scheme=w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_1").VCLObject("pnMain").VCLObject("pnLeft").VCLObject("pnTemplate")

    w_scheme.Window("TEdit", "*", 1).Click();
    
    //переход на вкладку "Все"    
    w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("pGrid").VCLObject("pnTemplateTabs").VCLObject("pcTemplateFilter").ClickTab("Все");
    w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid").Keys(Runner.CallMethod("Unit_var.pr_templates_id")); 
    delay(1000); 
    
            
    //окно для поиска типовой схемы по id
    Aliases.Automedi.VCLObject("fSearch2").Close();
    delay(2000); 
        
    w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("tbSelect").Click();    
    Runner.CallMethod("Unit_var.close_confirmation_window", w0);
    
    delay(1000);    
    w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("btnAddDrugPrescr").Click(); 
    delay(2500);    
    
    // удаление
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
