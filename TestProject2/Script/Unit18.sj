var pr_drugs_id=436;
var w0=Sys.Process("Automedi"); 
var pr_templates_id=220; // айдишник схемы приема
var intake_method_i=2; //просто порядковый номер способа введения из глоссария 
var number = 13457; 
var duration = 5;
var break_between_schemes=7


/*
function Test18()     //изменить единицу измерения медикамента
{   
               
    //w1 - верхняя часть объекта "амбулаторные назначения"   
    
    w1=Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.TPatDocControl_935A08B5B8DF4F818224FADDDC3642E2.TPageControl.TTabSheet.PatDrugDocAmbForm.PanelTop.TabControl1;    
    
    w1.VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("edMed").Click()
    
    //w2 - глоссарий справа
    w2=Aliases.Automedi.AMMain.pGlossaire.pMain.PageControl1.PanelGlossDrug.pcDrugs
    w2.tsDrugList.GridDrugsForm.pGrid.VCLObject("pSearch").Window("TEdit", "", 3).Keys(pr_drugs_id)
    
    delay (2500);
    w2.tsDrugList.GridDrugsForm.VCLObject("tbAddDrug").Click();
  
    if (w0.WaitWindow("TMessageForm", "Подтверждение", -1, 10000).Exists)
    {
       w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("No").Click();
       if (w0.WaitWindow("TMessageForm", "Подтверждение", -1, 5000).Exists)     //это нужно будет убрать сразу после того как ошибку исправят, второго предупреждения быть не должно
       {
           w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("No").Click();
       }         
    }        
    delay(2500);
        
    //w5 - калькулятор для схемы приема   
    var w5 = w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("fSimpleTemplateEdit");  
    
    intake(w1, intake_method_i);    
           
    //добавляем назначение  
    delay (3500); 
    w1.PanelNaznach.VCLObject("btnAddDrugPrescr").Click();  
  
}

*/



function TestProc()
{
  var AConnection, RecSet, Cmd, Prm;
  // Create a new Connection object
  AConnection = ADO.CreateConnection();
  // Note that you can also create an ADO connection using the following code:
  // AConnection = new ActiveXObject("ADODB.Connection");

  AConnection.ConnectionString = "Provider=MSDASQL;Persist Security Info=False;User ID=sa;password=system;Data Source=gresova";
 
  //Server=SQL-SERVER;Database=Testers_800_DEV_btk";//user id=sa;password=system";
  
  //AConnection.LoginPrompt=true;
  AConnection.Open();
  // Create a new Command object
  Cmd = ADO.CreateCommand();
  // To create an ADO command you can also use the following code:
   Cmd = new ActiveXObject("ADODB.Command");
  // Specify the connection
  Cmd.ActiveConnection = AConnection;
  // Specify command type and text
  Cmd.CommandType = adCmdText;
  Cmd.CommandText = "SELECT COALESCE(mnn1.RUSNAME, subs.RUSNAME, mnn2.RUSNAME) as NAME, mnns.FORDER, mnns.QUANTITY, me.LABEL, 1 as RUS FROM PR_DRUG_MNNS mnns LEFT JOIN PR_DRUG_SUBSTANCES subs ON mnns.PR_DRUG_SUBSTANCES_ID = subs.PR_DRUG_SUBSTANCES_ID LEFT JOIN CP_MNN mnn1 ON subs.CP_MNN_ID = mnn1.CP_MNN_ID LEFT JOIN CP_MNN mnn2 ON mnns.CP_MNN_ID = mnn2.CP_MNN_ID LEFT JOIN DM_MEASURE me on mnns.MEASURE_ID = me.DM_MEASURE_ID WHERE mnns.PR_DRUGS_ID = 3903";
  RecSet = Cmd.Execute();
  str=[]
  //Log.Message(RecSet.Fields("PATDIREC_ID").Value);
    while (! RecSet.EOF )
  {
    curr_str=RecSet.Fields("NAME").Value+ " "+String(RecSet.Fields("QUANTITY"))+" " +RecSet.Fields("LABEL").Value
    str.push(curr_str)
    Log.Message(RecSet.Fields("NAME").Value, RecSet.Fields("FORDER").Value, RecSet.Fields("QUANTITY").Value, RecSet.Fields("LABEL").Value);
    RecSet.MoveNext();
  }
  recept_mmn=''
  for (i = 0; i < str.length; i++)
  {
    if (i!=str.length-1)
    {
    recept_mmn=recept_mmn+str[i]+"+"
    }
    else 
    {
        recept_mmn=recept_mmn+str[i]
    }
  }
  
  Log.Message (recept_mmn)
  // Create a new parameter
  /*Prm = Cmd.CreateParameter("MyParam", adInteger, adParamInput);
  Cmd.Parameters.Append(Prm);
  // Specify the parameter value
  Prm.Value = 1940;
  // Execute the command
  RecSet = Cmd.Execute();
  // Process the results
  RecSet.MoveFirst();
  while (! RecSet.EOF )
  {
    Log.Message(RecSet.Fields("Author").Value, RecSet.Fields("Year Born").Value);
    RecSet.MoveNext();
  }      */
  AConnection.Close();
} 






















//DatabaseName=Testers_800_DEV_btk
//ServerName=10.1.1.3\SQLSERVER2014
//10.1.1.3\SQLSERVER2014
//10.1.1.3\SQLSERVER2014

           //User Id = sa; Password = system;";
           //Integrated Security=SSPI;