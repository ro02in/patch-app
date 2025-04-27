
public class Patch{

    private String[] creator; // Denna behöver inte vara en array, jag tror vi egentligen bör använda en separat klass för detta eller att vi kör arraylist av det, alternativt att vi håller det fritext, öppnar dock upp för problem med stavning osv osv.
    private String fromKM;
    private Person fromPerson; // Byt till user sen när vi fixat det, alternativt sätt user i konstruktorn.
    private String history;
    private String about; //kanske ta bort denna, history och comment bör va tillräckligt?
    private Person owner;
    private Image picture = ImageIO.read(new File("picture.png")); // Look into this, recommend reading more at https://stackoverflow.com/questions/34072052/is-it-possible-to-add-an-image-png-as-an-attribute-of-a-java-class
    private int tradeCount; //kanske ta bort denna
    private String status; //Skulle va bra o ha klart definierade val här men for now lämnar jag det som sträng så löser vi det. Skulle funka bra med "tag-system" men vi får kolla vidare på det senare
    private String comment;

    //Skriv om konstruktorn allt eftersom variabler uppdateras, vi behöver också gå igenom exakt vilka variabler vi ska ha som obligatoriska och göra overloaded konstruktorer för dessa.
    public Patch(String[] creator, String fromKM, Person fromPerson, String history, String about, Person owner, Image picture, int tradeCount, String status, String comment){
        this.creator = creator;
        this.fromKM = fromKM;
        this.fromPerson = fromPerson;
        this.history = history;
        this.about = about;
        this.owner = owner;
        this.picture = picture;
        this.tradeCount = tradeCount;
        this.status = status;
        this.comment = comment;
    }

    public String[] getCreator(){
        return creator;
    }
    public String getFromKM(){
        return fromKM;
    }
    public String getFromPerson(){
        return fromPerson
    }
    public String getHistory(){
        return history;
    }
    public String getAbout(){
        return about;
    }
    public getOwner(){
        return owner;
    }

    //Image systemet behöver vi prata om, for now är denna placeholder här. Vi kan antingen ha file location, inläst byte[] eller bara en sträng med file path. Behöver läsa på mer om detta dock.
    public Image getPicture(){
        return picture;
    }
    public int getTradeCount(){
        return tradeCount;
    }
    public String getStatus(){
        return status;
    }
    public String getComment(){
        return comment;
    }
}