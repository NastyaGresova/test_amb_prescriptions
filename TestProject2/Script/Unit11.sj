function Test11()     // восстановление назначений (2 штуки из тестов 9 и 10)
{

    var w0;    
    w0=Sys.Process("Automedi");

    // грид:
    var w1 = Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.TPatDocControl_935A08B5B8DF4F818224FADDDC3642E2.TPageControl.TTabSheet.PatDrugDocAmbForm.pGrid.GridPanel.Grid; 

    // тулбар для грида с назначениями
    w2 = Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.TPatDocControl_935A08B5B8DF4F818224FADDDC3642E2.TPageControl.TTabSheet.PatDrugDocAmbForm.VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar")

    w1.VScroll.Pos = 5; 

    delay(3000);

     //кнопка для восстановления назначения
    w2.VCLObject("TToolButton_8").Click();

    // подтверждение перед восстановлением:
    w3 = Aliases.Automedi.Window("TMessageForm", "Подтверждение", 1)  
    w3.VCLObject("Yes").Click(); 
    
    delay(3000); 
    w1.VScroll.Pos = 6; 
    //кнопка для восстановления назначения
    w2.VCLObject("TToolButton_8").Click();

    // подтверждение перед восстановлением:
    w3 = Aliases.Automedi.Window("TMessageForm", "Подтверждение", 1)  
    w3.VCLObject("Yes").Click(); 

}