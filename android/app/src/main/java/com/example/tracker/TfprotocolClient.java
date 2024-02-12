package com.example.tracker;

import android.telecom.Call;

import com.nerox.client.Tfprotocol;
import com.nerox.client.callbacks.ITfprotocolCallback;
import com.nerox.client.connection.Client;
import com.nerox.client.keepalives.UDPKeepAlive;
import com.nerox.client.misc.TCPTimeouts;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import io.flutter.plugin.common.MethodChannel;

/**
 *
 * @author alexgi
 */
public class TfprotocolClient {
    private Tfprotocol tfprotocol;

    private String user;
    private String password;

    public TfprotocolClient() {
    }

    public void createSession(String ipServer, int portServer, String user, String password, int len, ITfprotocolCallback callback){

        this.user = user;
        this.password = password;

        String hash = "testhash";
        String protocol = "0.0";

        String pkey = String.join("\n"
                , "-----BEGIN PUBLIC KEY-----"
                , "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmm8HzASM58ZMT237SR/h"
                , "LK6Ggxj8PXBwNknow2csna/3p1O4+dOLWwOvDl7fBSCOvpU0AtUfnsL66zLf+kBd"
                ,"cPY72E9ZnrHS4LmkJ6+J49U08swo9zTsxXjMV+gbB0G/gky1tdWn1GA56axAlFgc"
                ,"RNgYLaJKb2frulg/qBo7Gy8uONCUiD9IchEIvVxR1M6ZJ8Cx+lb4FFWpJO+QjKh+"
                ,"at1v3Q0De+BTu2pC9GKU4OMC9n4+RPE1TnsNT159o8CxAHuLvGIC2NF0SbIKNpAq"
                ,"EbyC6HR1QaivDCB9qTWht2pJmEY2SJTCTwp6GC6iwL3vpOEXr9yYdLFRy/1yyIly"
                ,"NwIDAQAB"
                ,"-----END PUBLIC KEY-----"
        );

        this.tfprotocol = new Tfprotocol(
                ipServer,
                portServer,
                pkey.trim(),
                hash,
                len,
                protocol,
                callback);
    }

    public void connect(){
        try{
            Utils.runThread(() {
                tfprotocol.connect(UDPKeepAlive.TYPE.UDP_PROCHECK, 3, 3, 3);
                tfprotocol.echoCommand("CONECTADO")
            });
        }catch(RuntimeException e){
            e.printStackTrace();
        }
    }

    public void disconnect(){
        try{
            Utils.runThread(() -> this.tfprotocol.disconnect());
        }catch(RuntimeException e){
            e.printStackTrace();
        }
    }

    private boolean isConnect(){
//        Utils.runThread(() -> );
        return this.tfprotocol.isConnect();
    }

    public void sup(String path, byte[] data, int timeout){
        try{
            Utils.runThread(() -> {
                InputStream inputStream = new ByteArrayInputStream(data);
                this.tfprotocol.supCommand(path, inputStream, timeout);
            });
        }catch(RuntimeException e){
            e.printStackTrace();
        }
    }

    public void fstat(){
        try{
            String path = Utils.sha256(user + password) + ".sd";
            Utils.runThread(() -> this.tfprotocol.fstatCommand(path));
        }catch(RuntimeException e){
            e.printStackTrace();
        }
    }

    public void rename(String pathOld, String pathNew){
        try{
            Utils.runThread(() -> this.tfprotocol.renamCommand(pathOld, pathNew));
        }catch(RuntimeException e){
            e.printStackTrace();
        }
    }

    private String normalizePath(String path){
        return this.normalizePath(path, "/");
    }

    private String normalizePath(String path, String usingSeparator){
        String sep = System.getProperty("file.separator");
        return path.replace(usingSeparator, sep);
    }
    /**  
     * Join N paths togethers normalizing them with the system separators 
    **/
    private String joinPaths(String ...paths){
        StringBuilder sb = new StringBuilder();
        String sep = System.getProperty("file.separator");
        for(String path : paths){
            String rpath = normalizePath(path);
            if (!rpath.endsWith(sep))
                sb.append(sep);
            sb.append(rpath);
        }
        return sb.toString();
    }

}
