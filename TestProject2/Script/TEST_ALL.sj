function test_all()  
{
var w0=Sys.Process("Automedi");
w0.VCLObject("fStart").VCLObject("bStart").Click();

delay(10000);

w0.VCLObject("frmConnect").VCLObject("pConnect").VCLObject("edCode").Keys("system");
delay(1500);
//w0.VCLObject("frmConnect").VCLObject("Panel1").VCLObject("BitBtn1").Click()
}