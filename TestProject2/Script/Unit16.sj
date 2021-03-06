function Test16()     // добавление схемы приема из калькулятора (+ Затем через Х дней)
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
  
    //w_calc - калькулятор для схемы приема 
    var w_calc = w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("fSimpleTemplateEdit");
  
    //w_scheme поле для схемы приема
    w_scheme=w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_1").VCLObject("pnMain").VCLObject("pnLeft").VCLObject("pnTemplate")
    w_scheme.Window("TEdit", "*", 1).Click();
    delay(5000);
    
    arr = Runner.CallMethod("Unit_var.num", Runner.CallMethod("Unit_var.dose_calc"));
    
    Runner.CallMethod("Unit_var.calc_int", w2, arr);
   
    var button_name  = "btn"+String(Runner.CallMethod("Unit_var.duration"))
    
    w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("fSimpleTemplateEdit").VCLObject(button_name).Click(); 
    w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("fSimpleTemplateEdit").VCLObject("btnDuring").Click();
    delay(2000)
    w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("fSimpleTemplateEdit").VCLObject("btnDay").Click();
        
    w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("tbSelect").Click(36, 12);
    delay (2000);
    
    w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBarView").PopupMenu.Click("+ Затем через [] дней"); 
    delay (2000);     
        
    // w_break_between_schemes - окно для заполнения перерыва между схемами
    w_break_between_schemes = Sys.Process("Automedi").VCLObject("FormSelectDays")
    w_break_between_schemes.VCLObject("SpinEdit1").Keys(String(Runner.CallMethod("Unit_var.break_between_schemes")));
    w_break_between_schemes.VCLObject("Button1").Click();

    Runner.CallMethod("Unit_var.close_confirmation_window", w0);
  
    //добавляем назначение  
    delay (3500); 
    w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("btnAddDrugPrescr").Click(); 
    delay(5000);  

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