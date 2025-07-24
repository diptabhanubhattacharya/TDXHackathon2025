public with sharing class ExampleofFuture {

    @future (callOut=True)
    public  static void getAccount(){
         system.debug ('I am a future class');
    }
}