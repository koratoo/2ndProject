package kr.co.softsoldesk.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

//단방향 알고리즘정책을 쓴다고 할때
public class PasswordEncryptor {

	public static String encrypt(String plainText) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(plainText.getBytes());
        byte[] bytes = md.digest();
        
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b & 0xff));
        }
        return sb.toString();
    }
}

/*
입력받은 문자열을 MD5 방식으로 암호화
MessageDigest 클래스를 사용하여 MD5 암호화 객체를 생성한다
입력받은 문자열을 byte 배열로 변환한 후, 암호화한다
암호화된 결과는 byte 배열로 리턴되고, 이를 16진수 문자열로 변환하여 리턴한다.
(16진수 문자열은 각 byte 값의 하위 4bit씩을 16진수 문자로 표현한 것이다)
따라서 byte 값을 & 연산자를 사용하여 하위 4bit만을 추출한 후, 이를 16진수 문자로 변환한다.
StringBuilder 클래스를 사용하여 암호화된 결과물을 하나의 문자열로 합쳐서 리턴한다.
*/