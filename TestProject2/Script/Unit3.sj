function Test3()     //  нахожусь уже на форме с амбулаторными назначениями, проверка перехода на разные вкладки
{

var w0;
var pr_drugs_id=436;
w0=Sys.Process("Automedi");


// w2 - глоссарий справа
var w2 = Runner.CallMethod("Unit_var.return_w2"); 

//w1 - объект "амбулаторные назначения"
var w1 = Runner.CallMethod("Unit_var.return_w1");

w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("edMed").Click();

w2.ClickTab("Часто используемые");
delay(1500);
w2.ClickTab("Типовые"); 
delay(1500);   
w2.ClickTab("Список"); 
delay(1500);   
w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 3).Keys(pr_drugs_id);
}                                                                                                                                                     ; 
