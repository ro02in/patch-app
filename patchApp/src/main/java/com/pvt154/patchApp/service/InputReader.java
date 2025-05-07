package com.pvt154.patchApp.service;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Scanner;

//Jag importerade hela min inputReader från Hundregistret, detta behöver vi dock modifiera vidare för att se till att det är anpassat för vårt nya projekt
//Update 2025/05/07 Nick: jag uppdaterade klasserna så at de inte tar några parametrar och bara returnar det vi vill att dom ska returna
//Felmeddelandet i Konstruktorn är ngt som kanske behöver diskuteras men hopefully funkar detta. Vi måste bara komma ihåg att skicka in en InputStream
//När vi initierar inputreader, annars bör det funka.
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


    public String readString() {
        return inputScanner.nextLine().trim();
    }

    public int readInt() {
        int numberInput = inputScanner.nextInt();
        inputScanner.nextLine();
        return numberInput;
    }

    public double readDouble() {
        double doubleInput = inputScanner.nextDouble();
        inputScanner.nextLine();
        return doubleInput;
    }

    public void close() {
        inputScanner.close();
    }
}

