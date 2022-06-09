var w0_var=Sys.Process("Automedi"); // просто процесс автомеди
//var w1 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VCLObject("TPatDocControl_935A08B5B8DF4F818224FADDDC3642E2").Window("TPageControl", "", 1) // w1 - объект "амбулаторные назначения"  в записи "направления-назначения"
//var w11 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VCLObject("TPatDocControl_DA9944085BBF48B1A654475E76146D49").Window("TPageControl", "", 1) //w11 - объект "амбулаторные назначения"  в записи с диагнозами
//var w2 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("PanelGlossDrug").VCLObject("pcDrugs") // w2 - глоссарий справа объекта "амбулаторные назначения" 
//var w3 = Sys.Process("Automedi").VCLObject("DirServEditor") // w3 - окно-редактор назначения
//var w4 = Sys.Process("Automedi").VCLObject("fmPRDrugsRecipeEdit") // w4 - окно-редактор рецепта


var patients_id_var=535828;
var pr_drugs_id_var = 436;   // id медикамента
var scheme_name="test_1" //название схемы приема из контекстного меню медикамента
var pr_drugs_id_list = [434, 436, 463, 442];   //id медикаментов, на основе которых делается составное назначение 
var pr_templates_id_var = 220; // id схемы приема
var intake_method_i_var = 2; //просто порядковый номер способа введения из глоссария 
var dose_calc_var = 13457; //  дозировка для ввода в калькулятор
var duration_var = 5;  //   длительность назначения (дней, месяцев и т.д.)
var break_between_schemes_var = 7  //  перерыв между схемами
var arr_diagnoz = [1792, 4307, 4431];   // массив с id диагнозов
var arr_diagnoz_type=["1 - основное заболевание", "2 - осложнение основного заболевания", "3 - сопутствующее заболевание"]
var arr_diagnoz_type_icd=["основное заболевание", "осложнение основного заболевания", "сопутствующее заболевание"]
var pr_drugs_id_composite_mnn = 620; //     id медикамента со сложным МНН
var pr_drugs_recipe_type_id_var=3; // тип рецепта id   ??????
var pr_validity_period_id_var=5; // длительность рецепта
var series_recipe=567;  //  серия рецепта
var number_recipe=76; // номер рецепта
var drugs_amount_recipe=67;  //  количество медикамента в рецепте
var pr_drugs_recipe_type_id=3; //  ??????
var pr_template_schemes_id=4211;  //  id типового назначения 
var pr_template_schemes_id_list = [4211, 4210, 4209, 4201];   //id типовых назначений, массив добавила на тот случай, если проверять буду сразу несколько типовых назначений 

var name_motconsu="Поликлиника - Направления/Назначения"
var name_motconsu_diagnoz = "Осмотр - Терапевт"



/*
"1 - основное заболевание"
"2 - осложнение основного заболевания"
"3 - сопутствующее заболевание"
"1.1 - фоновое заболевание"
"1.2 - конкурирующее"
"1.3 - сочетанное"
*/


function patients_id()
{
   return (patients_id_var);
}

function pr_drugs_id()
{
   return (pr_drugs_id_var);
}

function return_scheme_name()
{
   return (scheme_name);
}

function return_pr_template_schemes_id()
{
   return (pr_template_schemes_id);
}

function return_pr_template_schemes_id_list()
{
   return (pr_template_schemes_id_list);
}

function return_pr_drugs_id_list()
{
   return (pr_drugs_id_list);
}

function return_name_motconsu()
{
   return (name_motconsu);
}

function return_name_motconsu_diagnoz()
{
   return (name_motconsu_diagnoz) ;
}

function return_pr_drugs_recipe_type_id()
{
   return (pr_drugs_recipe_type_id_var)
}


function return_drugs_amount_recipe()
{
   return (drugs_amount_recipe)
}

function return_series_recipe()
{
   return (series_recipe)
}

function return_number_recipe()
{
   return (number_recipe)
}

function return_pr_validity_period_id()
{
   return (pr_validity_period_id_var)
}

function return_pr_drugs_id_composite_mnn()
{
   return (pr_drugs_id_composite_mnn)
}

function return_arr_diagnoz()
{
   return (arr_diagnoz)
}

function return_arr_diagnoz_type()
{
   return (arr_diagnoz_type)
}

function return_arr_diagnoz_type_icd()
{
   return (arr_diagnoz_type_icd)
}

function pr_templates_id()
{
   return (pr_templates_id_var)
}

function intake_method_i()
{
   return (intake_method_i_var)
}

function dose_calc()
{
   return (dose_calc_var)
}

function duration()
{
   return (duration_var)
}

function break_between_schemes()
{
   return (break_between_schemes_var)
}


function return_w1()
{
   var w1 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VCLObject("TPatDocControl_935A08B5B8DF4F818224FADDDC3642E2").Window("TPageControl", "", 1) // w1 - объект "амбулаторные назначения"  в записи "направления-назначения"
   return (w1)
}
function return_w11()
{
var w11 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VCLObject("TPatDocControl_DA9944085BBF48B1A654475E76146D49").Window("TPageControl", "", 1) //w11 - объект "амбулаторные назначения"  в записи с диагнозами     
   return (w11)
}
function return_w2()
{
var w2 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("PanelGlossDrug").VCLObject("pcDrugs") // w2 - глоссарий справа объекта "амбулаторные назначения" 
   return (w2)
}
function return_w3()
{
var w3 = Sys.Process("Automedi").VCLObject("DirServEditor") // w3 - окно-редактор назначения 
   return (w3)
}
function return_w4()
{
var w4 = Sys.Process("Automedi").VCLObject("fmPRDrugsRecipeEdit") // w4 - окно-редактор рецепта 
   return (w4)
}

function num(number)  //функция переделывает введенную дозировку в массив чисел, для того чтобы далее использовать его в калькуляторе
{     
  var arr = [];
  while (number>0)
  {
     arr.push(String(number%10))
     number = (Math.floor(number/10))        
  }
  return (arr)
}

function intake(w1, i)
{
  //поле для способа введения
    //w1.VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("dblPrIntakeMethods").VCLObject("Code").Window("Edit", "", 1).Click();
    w1.VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("dblPrIntakeMethods").VCLObject("Code").Window("Edit", "", 1).Click(); 
    //delay(2000);
    var j=i*15.6-5;
    Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("GlossarySheet").VCLObject("tcGlossKind").Window("TGlossViewer", "", 1).DblClick(38, j);
    //Aliases.Automedi.AMMain.pGlossaire.pMain.PageControl1.GlossarySheet.tcGlossKind.TGlossViewer.DblClick(38, j);
    //delay(2000);
} 

function intake1(w0, i)
{
  //поле для способа введения
   

    var j=i*15.6-5;
    w0.pRecord.VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("GlossarySheet").VCLObject("tcGlossKind").Window("TGlossViewer", "", 1).DblClick(38, j);
} 


function calc_int(w2, arr)      //функция на калькуляторе набирает дозировку
{
  for (i = (arr.length - 1); i >= 0; i--)
  {
    var button_name="btn"+arr[i]
    w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("fSimpleTemplateEdit").VCLObject(button_name).Click();
  }  
  w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("fSimpleTemplateEdit").VCLObject("btnDosage").Click();
}

function close_confirmation_window(w0)
{
    if (w0.WaitWindow("TMessageForm", "Подтверждение", -1, 1500).Exists)
      {
         w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("No").Click();
         if (w0.WaitWindow("TMessageForm", "Подтверждение", -1, 1500).Exists)     //это нужно будет убрать сразу после того как ошибку исправят, второго предупреждения быть не должно
         {
             w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("No").Click();
         }         
      }
} 

function diagnoses(w1, arr_diagnoz, arr_diagnoz_type)
{
   for (i = 0; i < arr_diagnoz.length; i++)
  {
    w1.VCLObject("tbNew").Click()
    //выбор "типа" диагноза (основное, сопутствующее и т.д.)
    Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.TFormContainer_6C9F6C7474D94283A5C611485257F3B8.TDBRadioCombo_B7DD45A628B14ED2A20CD4973844CDAF.TDBValuesComboBox.Keys(arr_diagnoz_type[i]) 
    //лукап для выбора диагноза:
    Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.TFormContainer_6C9F6C7474D94283A5C611485257F3B8.TDBLookup_84F7CC410C7F4B469C0F222C0BB9DBC8.bRun.Click() 
    // вводим id диагноза
    Aliases.Automedi.ClassifLookDocTree.ListPanel.pGrid.pSearch.Window("TEdit", "*", 1).Keys(arr_diagnoz[i])
    delay(2000)
    // выбраем диагноз
    Aliases.Automedi.ClassifLookDocTree.VCLObject("BtnOk").Click();
    delay(2000)
  }
 // return(arr_diagnoz_name)
}


function find_amb_prescriptions(height, max_height)
{
  current_height=127
  while (current_height+height < max_height)
  {
      current_height=current_height+height;
      Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.VScroll.Pos=current_height;
  }  
}
function db_connection(query)
{
    var AConnection, RecSet, Cmd, Prm;
    AConnection = ADO.CreateConnection();
    AConnection.ConnectionString = "Provider=MSDASQL;Persist Security Info=False;User ID=sa;password=system;Data Source=gresova";
    AConnection.Open();
    Cmd = ADO.CreateCommand();
    Cmd = new ActiveXObject("ADODB.Command");
    Cmd.ActiveConnection = AConnection;
    Cmd.CommandType = adCmdText; 
    Cmd.CommandText =  query;
    RecSet = Cmd.Execute();
    return(RecSet)
}



//w1 - объект "амбулаторные назначения"  в записи "направления назначения"


