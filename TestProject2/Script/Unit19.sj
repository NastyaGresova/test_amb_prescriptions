function Test19()   // здесь просто создаю запись "осмотр - терапевет" (нужно, чтобы в записи была ЭФ "Диагноз"), добавляю диагнозы и перехожу на ЭФ с амбулаторными назначениями
{  
  var w0=Sys.Process("Automedi");
  w0.VCLObject("AMMain").VCLObject("bNewEditCons").Click();
  w0.VCLObject("fNewCons").VCLObject("PageControl2").VCLObject("MainTabSheet").VCLObject("BasePanel").VCLObject("TypeRecPanel").Window("TPanel", "", 1).VCLObject("lbModels").VScroll.Pos = 0;
  w0.VCLObject("fNewCons").VCLObject("PageControl2").VCLObject("MainTabSheet").VCLObject("BasePanel").VCLObject("TypeRecPanel").Window("TPanel", "", 1).VCLObject("lbModels").Keys("терапевт");  //Keys(Runner.CallMethod("Unit_var.return_name_motconsu_diagnoz")); 
  delay(3000);
  
  w0.VCLObject("fNewCons").VCLObject("Panel1").VCLObject("Panel2").VCLObject("BitBtn1").Click();
  if (w0.Window("TMessageForm", "Подтверждение", 1) !== false)
  {
       w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("No").Click();
  } 
  
  delay (7000);
  
  w0.VCLObject("AMMain").VCLObject("bNewEditCons").Click();
  w0.VCLObject("fNewCons").VCLObject("PageControl2").VCLObject("MainTabSheet").VCLObject("BasePanel").VCLObject("TypeRecPanel").Window("TPanel", "", 1).VCLObject("lbModels").VScroll.Pos = 0;
  w0.VCLObject("fNewCons").VCLObject("PageControl2").VCLObject("MainTabSheet").VCLObject("BasePanel").VCLObject("TypeRecPanel").Window("TPanel", "", 1).VCLObject("lbModels").Keys("терапевт");  //Keys(Runner.CallMethod("Unit_var.return_name_motconsu_diagnoz")); 
  delay(3000);
  
  w0.VCLObject("fNewCons").VCLObject("Panel1").VCLObject("Panel2").VCLObject("BitBtn1").Click();
  if (w0.Window("TMessageForm", "Подтверждение", 1) !== false)
  {
       w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("No").Click();
  } 
  
  delay (7000);
    
  current_name_button="TSpeedButton_";
  var i=2;
  var c=0;
  while (Sys.Process("Automedi").VCLObject("AMMain").WaitVCLObject((current_name_button + String(i)), 1000).Exists && c==0)
  {  
      if (Sys.Process("Automedi").VCLObject("AMMain").VCLObject((current_name_button + String(i))).Caption == " Диагноз")
      {
           Sys.Process("Automedi").VCLObject("AMMain").VCLObject((current_name_button + String(i))).Click();
           c=1;
      }
      i++;
  }   
 
  // w_table - таблица для диагнозов
  var w_table= Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.VCLObject("TFormContainer_6C9F6C7474D94283A5C611485257F3B8").VCLObject("TNLine_482BE52676A047F797752AEF8312E0FF")

  arr_diagnoz = Runner.CallMethod("Unit_var.return_arr_diagnoz");
  arr_diagnoz_type = Runner.CallMethod("Unit_var.return_arr_diagnoz_type");  

  Runner.CallMethod("Unit_var.diagnoses", w_table, arr_diagnoz, arr_diagnoz_type);

  /*var j=0, c=0;   - подстрока в строке

  var str=Aliases.Automedi.AMMain.VCLObject("TSpeedButton_10").Caption
  var str_nazn="Назначения"

  for (i = 0; i < str.length; i++)
  {
    for (j=0; j < str_nazn.length; j++)
    {
       if  (str.charAt(i)==str_nazn.charAt(j) && c!=0)
       {
        c=c+1
       }
       if (str.charAt(i)==str_nazn.charAt(j) && c!=0)
    }
      if (str.charAt(i)==str_nazn.charAt(j))
      {
    
      }
      elif (str.charAt(i)!=str_nazn.charAt(j) )
      {
    
      }
      for (j=0; i < str.length; i++)
      a= str.charAt(i)
       Log.Message('str[i]:   ' + a + '   ' + typeof(a)) 
  }

  */
  
  
  current_name_button="TSpeedButton_";
  var i=2;
  var c=0;
  while (Sys.Process("Automedi").VCLObject("AMMain").WaitVCLObject((current_name_button + String(i)), 1000).Exists && c==0)
  {    
      if (Sys.Process("Automedi").VCLObject("AMMain").VCLObject((current_name_button + String(i))).Caption == " Назначения/Рецепты")
      {
           Sys.Process("Automedi").VCLObject("AMMain").VCLObject((current_name_button + String(i))).Click();
           c=1;
      }
      i++;
  }  


}
