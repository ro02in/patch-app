package com.pvt154.patchApp.service;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Scanner;

//Jag importerade hela min inputReader från Hundregistret, detta behöver vi dock modifiera vidare för att se till att det är anpassat för vårt nya projekt
public class InputReader {
    private static ArrayList<InputStream> streams = new ArrayList<>();
    private final Scanner inputScanner;


    public InputReader(InputStream stream) {
        if (stream == null || streams.contains(stream)) {
            throw new IllegalStateException("Felmeddelande");
        } else {
            inputScanner = new Scanner(stream);
            streams.add(stream);
        }
    }

    public InputReader() {
        this(System.in);
    }


    public String readString(String prompt) {
        System.out.println(prompt + "?>");
        return inputScanner.nextLine().trim();
    }

    public int readInt(String prompt) {
        System.out.println(prompt + "?>");
        int numberInput = inputScanner.nextInt();
        inputScanner.nextLine();
        return numberInput;
    }

    public double readDouble(String prompt) {
        System.out.println(prompt + "?>");
        double doubleInput = inputScanner.nextDouble();
        inputScanner.nextLine();
        return doubleInput;
    }

    public void close() {
        inputScanner.close();
    }
}

