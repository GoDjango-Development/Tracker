package cu.alexgi.test_tfprotocol;

import com.google.gson.Gson;
import com.nerox.client.Tfprotocol;
import com.nerox.client.callbacks.ITfprotocolCallback;
import com.nerox.client.connection.Easyreum;
import com.nerox.client.constants.TfprotocolConsts;
import com.nerox.client.misc.FileStat;
import com.nerox.client.misc.StatusInfo;
import com.nerox.client.misc.StatusServer;

import io.flutter.plugin.common.MethodChannel;

/**
 *
 * @author alexgi
 */
public class Callback implements ITfprotocolCallback{
    private Tfprotocol tfprotocol;
    private final MethodChannel platfrom;

    public Callback(MethodChannel platfrom) {
        this.platfrom = platfrom;
    }

    @Override
    public void statusServer(StatusInfo status) {
        System.out.println("------------------------------");
        System.out.println(status.getStatus());
        System.out.println(status.getMessage());
        System.out.println(status.getPayload()!=null ?new String(status.getPayload()):"");
        System.out.println(status.getCode());
        System.out.println("------------------------------");

        Utils.runUiThread(() -> platfrom.invokeMethod("statusServer", new Gson().toJson(status, StatusInfo.class)));
    }
    @Override
    public void loginCallback(StatusInfo info){
        this.statusServer(info);
    }
    @Override
    public void responseServerCallback(StatusInfo status) {

    }

    @Override
    public void instanceTfProtocol(Tfprotocol instance) {
        this.tfprotocol = instance;
    }

    @Override
    public void dateCallback(Integer timestamp, StatusInfo status) {
        this.statusServer(status);
    }

    @Override
    public void datefCallback(java.util.Date date, StatusInfo status) {
        this.statusServer(status);
    }

    @Override
    public void dtofCallback(java.util.Date date, StatusInfo status) {
        this.statusServer(status);
    }
    @Override
    public void injailCallback(StatusInfo injail) {
        this.statusServer(injail);
    }

    @Override
    public void ftodCallback(Integer timestamp, StatusInfo status) {
        this.statusServer(status);
    }

    @Override
    public void fstatCallback(FileStat filestat, StatusInfo status) {
        this.statusServer(status);
        Utils.runUiThread(() -> platfrom.invokeMethod("fstatCallback", new Gson().toJson(filestat, FileStat.class)));
    }

    @Override
    public void sendFileCallback(boolean isOverwritten, String path, StatusInfo sendToServer, byte[] payload) {
        this.statusServer(sendToServer);
        sendToServer.setStatus(StatusServer.OK);
    }

    @Override
    public void rcvFileCallback(boolean deleteAfter, String path, StatusInfo sendToServer) {
        this.statusServer(sendToServer);
    }

    @Override
    public void lsCallback(StatusInfo status) {
        this.statusServer(status);
    }

    @Override
    public void lsrCallback(StatusInfo status) {
        this.statusServer(status);
    }

    @Override
    public void putCallback(Tfprotocol.Codes codes) {
    }

    @Override
    public void putStatusCallback(StatusInfo statusInfo) {
        this.statusServer(statusInfo);
    }

    @Override
    public void echoCallback(String value) {
        Utils.runUiThread(() -> platfrom.invokeMethod("echoCallback", value));
    }

    @Override
    public void tlbCallback(StatusInfo tlb) {
        this.statusServer(tlb);
    }

    @Override
    public void supCallback(StatusInfo sup) {
        this.statusServer(sup);
        Utils.runUiThread(() -> platfrom.invokeMethod("supCallback", new Gson().toJson(sup, StatusInfo.class)));
    }

    @Override
    public void sdownCallback(StatusInfo sdown) {
        this.statusServer(sdown);
    }

    @Override
    public void tlbUDPCallback(StatusInfo tlb) {
        this.statusServer(tlb);
    }
    
    @Override
    public void fsizeCallback(StatusInfo fsize) {
        this.statusServer(fsize);
    }

    @Override
    public void fsizelsCallback(StatusInfo fsizels) {
        this.statusServer(fsizels);
    }

    @Override
    public void xcpdirCallback(StatusInfo status) {
        this.statusServer(status);
    }

    @Override
    public void mkdirCallback(StatusInfo status) {
        ITfprotocolCallback.super.mkdirCallback(status);
    }

    @Override
    public void delCallback(StatusInfo status) {
        ITfprotocolCallback.super.delCallback(status);
    }

    @Override
    public void rmdirCallback(StatusInfo status) {
        ITfprotocolCallback.super.rmdirCallback(status);
    }

    @Override
    public void copyCallback(StatusInfo status) {
        ITfprotocolCallback.super.copyCallback(status);
    }

    @Override
    public void touchCallback(StatusInfo status) {
        ITfprotocolCallback.super.touchCallback(status);
    }

    @Override
    public void fupdCallback(StatusInfo status) {
        ITfprotocolCallback.super.fupdCallback(status);
    }

    @Override
    public void cpdirCallback(StatusInfo status) {
        ITfprotocolCallback.super.cpdirCallback(status);
    }

    @Override
    public void xcopyCallback(StatusInfo status) {
        ITfprotocolCallback.super.xcopyCallback(status);
    }

    @Override
    public void xdelCallback(StatusInfo status) {
        ITfprotocolCallback.super.xdelCallback(status);
    }

    @Override
    public void xrmdirCallback(StatusInfo status) {
        ITfprotocolCallback.super.xrmdirCallback(status);
    }

    @Override
    public void lockCallback(StatusInfo status) {
        ITfprotocolCallback.super.lockCallback(status);
    }

    @Override
    public void renamCallback(StatusInfo status) {
        ITfprotocolCallback.super.renamCallback(status);
        Utils.runUiThread(() -> platfrom.invokeMethod("renamCallback", new Gson().toJson(status, StatusInfo.class)));
    }

    @Override
    public void keepAliveCallback(StatusInfo status) {
        ITfprotocolCallback.super.keepAliveCallback(status);
    }

    @Override
    public void chmodCallback(StatusInfo chmodStatus) {
        ITfprotocolCallback.super.chmodCallback(chmodStatus);
    }

    @Override
    public void chownCallback(StatusInfo chownStatus) {
        ITfprotocolCallback.super.chownCallback(chownStatus);
    }

    @Override
    public void getCanCallback(StatusInfo pcanStatus, Easyreum easyreum) {
        ITfprotocolCallback.super.getCanCallback(pcanStatus, easyreum);
    }

    @Override
    public void putCanCallback(StatusInfo statusInfo, Easyreum easyreum) {
        ITfprotocolCallback.super.putCanCallback(statusInfo, easyreum);
    }

    @Override
    public void sha256Callback(StatusInfo statusInfo) {
        ITfprotocolCallback.super.sha256Callback(statusInfo);
    }

    @Override
    public void prockeyCallback(StatusInfo statusInfo) {
        ITfprotocolCallback.super.prockeyCallback(statusInfo);
    }

    @Override
    public void freespCallback(StatusInfo buildStatusInfo) {
        ITfprotocolCallback.super.freespCallback(buildStatusInfo);
    }

    @Override
    public void udateCallback(StatusInfo udate) {
        ITfprotocolCallback.super.udateCallback(udate);
    }

    @Override
    public void ndateCallback(StatusInfo ndate) {
        ITfprotocolCallback.super.ndateCallback(ndate);
    }

    @Override
    public void getWriteCallback(Tfprotocol.Codes codes) {
        ITfprotocolCallback.super.getWriteCallback(codes);
    }

    @Override
    public void getReadCallback(StatusInfo statusInfo) {
        ITfprotocolCallback.super.getReadCallback(statusInfo);
    }

    @Override
    public void nigmaCallback(StatusInfo bld_stat_inf) {
        ITfprotocolCallback.super.nigmaCallback(bld_stat_inf);
    }

    @Override
    public void rmSecureDirectoryCallback(StatusInfo bld_stat_inf) {
        ITfprotocolCallback.super.rmSecureDirectoryCallback(bld_stat_inf);
    }

    @Override
    public void lsv2Callback(StatusInfo buildStatusInfo) {
        ITfprotocolCallback.super.lsv2Callback(buildStatusInfo);
    }

    @Override
    public void fstypeCallback(TfprotocolConsts.FSTYPE value) {
        ITfprotocolCallback.super.fstypeCallback(value);
    }

    @Override
    public void fstypelsCallback(TfprotocolConsts.FSTYPE value) {
        ITfprotocolCallback.super.fstypelsCallback(value);
    }

    @Override
    public void fstatlsCommand(byte b, TfprotocolConsts.FSTYPE value, long wrap, long wrap1, long wrap2) {
        ITfprotocolCallback.super.fstatlsCommand(b, value, wrap, wrap1, wrap2);
    }

    @Override
    public void lsrv2Callback(StatusInfo statusInfo) {
        ITfprotocolCallback.super.lsrv2Callback(statusInfo);
    }
}
