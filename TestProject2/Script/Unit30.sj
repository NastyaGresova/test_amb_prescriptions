function Test30()      // редактирование назначения
{
    //w0 - окно-редактор назначения
    w0=Aliases.Automedi.DirServEditor;
    // поле для способа введения
    w0.pRecord.pcPrescr.tsIntakeScheme.pnTemplate.fmPRPlanBuilder_2.pnHeader.pnPrMain.VCLObject("dblPrIntakeMethods").VCLObject("Code").Window("Edit", "", 1).Click();
    // глоссарий справа со способами введения
    //w0.pRecord.VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("GlossarySheet").VCLObject("tcGlossKind").Window("TGlossViewer", "", 1)
    var i=4;
    Runner.CallMethod("Unit_var.intake1", w0, i);
    w0.VCLObject("tbClose").Click();
    
    //w1 - амбулаторные назначения
    w1=Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.TPatDocControl_DA9944085BBF48B1A654475E76146D49.TPageControl;
    w1.TTabSheet.PatDrugDocAmbForm.pTop.pTool.VCLObject("ToolBar").VCLObject("TToolButton_11").Click();
       
    
    var intake_method = w0.pRecord.pcPrescr.tsIntakeScheme.pnTemplate.fmPRPlanBuilder_2.pnHeader.pnPrMain.VCLObject("dblPrIntakeMethods").VCLObject("Code").Window("Edit", "", 1).wText;   
    query = "select CODE from PATDIREC_DRUGS join PR_INTAKE_METHODS on PATDIREC_DRUGS.PR_INTAKE_METHODS_ID = PR_INTAKE_METHODS.PR_INTAKE_METHODS_ID WHERE patdirec_id=2742103"
    
    RecSet = Runner.CallMethod("Unit_var.db_connection", query);    
    Log.Message(RecSet.Fields("CODE"));
    if (intake_method==RecSet.Fields("CODE"))
    {
      Log.Message("Ok")
    } 
    w0.Close();   
    // функцию intake надо переделать
}