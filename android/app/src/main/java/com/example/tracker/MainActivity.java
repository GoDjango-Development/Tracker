package cu.alexgi.test_tfprotocol;

import androidx.annotation.NonNull;

import com.nerox.client.Tfprotocol;
import com.nerox.client.callbacks.ITfprotocolCallback;
import com.nerox.client.connection.Easyreum;
import com.nerox.client.constants.TfprotocolConsts;
import com.nerox.client.misc.FileStat;
import com.nerox.client.misc.StatusInfo;
import com.nerox.client.misc.StatusServer;

import java.util.Date;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity{

    private String CHANNEL = "tfprotocol.client";
    private MethodChannel platfrom;

    private TfprotocolClient tfprotocolClient;
    private Callback callback;

    public static void main(String[] args) {
        
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        platfrom = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL);

        tfprotocolClient = new TfprotocolClient();

        callback = new Callback(platfrom);

        platfrom.setMethodCallHandler((call, result) -> {
            switch (call.method){
                case "config":
                    tfprotocolClient.createSession(call.argument("dns"), call.argument("port"),
                            call.argument("user"), call.argument("pass"), 64, callback);
                    break;
                case "connect":
                    tfprotocolClient.connect();
                    break;
                case "disconnect":
                    tfprotocolClient.disconnect();
                    break;
                case "sup":
                    tfprotocolClient.sup(call.argument("path"), call.argument("data"), call.argument("timeout"));
                    break;
                case "fstat":
                    tfprotocolClient.fstat();
                    break;
                case "rename":
                    tfprotocolClient.rename(call.argument("pathOld"), call.argument("pathNew"));
                    break;
            }
        });
    }
}