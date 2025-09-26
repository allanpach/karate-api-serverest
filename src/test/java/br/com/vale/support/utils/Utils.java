package br.com.vale.support.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;
import java.util.UUID;

import org.apache.commons.lang3.RandomStringUtils;

import static com.oracle.truffle.js.builtins.DateFunctionBuiltins.DateFunction.now;


public class Utils {

    public static String randomestringEight(){
        String generatedStringEight = RandomStringUtils .randomAlphabetic(8);
        return (generatedStringEight);
    }

    public static String randomeNumEight(){
        String generatedSNumberEight = RandomStringUtils.randomNumeric(8);
        return (generatedSNumberEight);
    }

    public static String randomeNumTen(){
        String generatedSNumberTen = RandomStringUtils.randomAlphabetic(10);
        return (generatedSNumberTen);
    }

    public static String password(){
        String generatedSNumberEight = RandomStringUtils.randomNumeric(5);
        return ("Test1@"+generatedSNumberEight);
    }

    public static String generateEmail(){
        String email = randomestringEight()+"@testes.com";
        return email;
    }

    public static String generateEmail2(){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
        LocalDateTime now = LocalDateTime.now();
        String email2 = now.format(formatter)+"test@test.com";
        return email2;
    }

    public static String generateNewName(){
        String name = "Teste"+randomeNumTen();
        return name;
    }

    public static String generateName() {
        int i, nrRandomVowel, nrRandomConsonant;
        final String vowel[] = {"a", "e", "i", "o", "u",};
        String nameYou = "", name = "";
        final String consonant[] = {
                "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n",
                "p", "q", "r", "s", "t", "w", "x", "y", "z"
        };

        final Random random = new Random();
        for (i = 0; i <= 8; i++) {
            nrRandomVowel = 0 + random.nextInt(4);//escolhe uma pos de 0 a 4
            nrRandomConsonant = 0 + random.nextInt(19);//escolhe pos de 0 a 19
            nameYou = vowel[nrRandomVowel] + consonant[nrRandomConsonant];
            name = name + "" + nameYou;

        }
        return nameYou;


    }
}
