package kr.co.softsoldesk.controller;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class AesEncryptor {

    private static final String secretKey = "01234567890123456789012345678901";
    private static final String iv = "0123456789012345";

    /**
     * 주어진 문자열을 AES 알고리즘을 이용하여 암호화합니다.
     *
     * @param plainText 암호화할 문자열
     * @return 암호화된 문자열
     */
    public static String encrypt(String plainText) throws Exception {
        IvParameterSpec ivParameterSpec = new IvParameterSpec(iv.getBytes("UTF-8"));
        SecretKeySpec secretKeySpec = new SecretKeySpec(secretKey.getBytes("UTF-8"), "AES");

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivParameterSpec);

        byte[] encrypted = cipher.doFinal(plainText.getBytes());

        return Base64.getEncoder().encodeToString(encrypted);
    }

    /**
     * 주어진 암호화된 문자열을 AES 알고리즘을 이용하여 복호화합니다.
     *
     * @param encryptedText 복호화할 암호화된 문자열
     * @return 복호화된 평문 문자열
     */
    public static String decrypt(String encryptedText) throws Exception {
        IvParameterSpec ivParameterSpec = new IvParameterSpec(iv.getBytes("UTF-8"));
        SecretKeySpec secretKeySpec = new SecretKeySpec(secretKey.getBytes("UTF-8"), "AES");

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, secretKeySpec, ivParameterSpec);

        byte[] decoded = Base64.getDecoder().decode(encryptedText);
        byte[] decrypted = cipher.doFinal(decoded);

        return new String(decrypted);
    }

}