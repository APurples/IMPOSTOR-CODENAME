var caShader:CustomShader = null;
var heatwave:CustomShader = null;

function create(){
    heatwave = new CustomShader("heatwave");
    heatwave.distortTexture.input = BitmapData.fromFile(Paths.getPreloadPath('images/stages/boiling/heatwave'));
    camGame.addShader(heatwave);
}