package entity;

import javax.servlet.http.Part;
import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class PossibleItem {
    private Integer id;
    private String name;
    private BigDecimal price;
    private String description;
    private int age;
    private List<String> base64Images = new ArrayList<>(); // might be the proper format to display on the page
    private List<Part> parts = new ArrayList<>();
    private List<byte[]> imageBytes = new ArrayList<>(); // for retrieving bytes from the database and then add them
    // to the table Item



    public void addPart(Part part) {
        this.parts.add(part);
    }

    public void add64Image(String image) {
        this.base64Images.add(image);
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<Part> getPart() {
        return this.parts;
    }

    public void setPart(List<Part> parts) {
        this.parts = parts;
    }

    public List<byte[]> getImageBytes() {
        return imageBytes;
    }

    public void setImageBytes(List<byte[]> imageBytes) {
        this.imageBytes = imageBytes;
    }

    public static class Builder implements CustomBuilder<PossibleItem> {
        PossibleItem possibleItem = new PossibleItem();

        public Builder setId(Integer id) {
            possibleItem.id = id;
            return this;
        }


        public Builder setName(String name) {
            possibleItem.name = name;
            return this;
        }

        public Builder setPrice(BigDecimal price) {
            possibleItem.price = price;
            return this;
        }

        public Builder setDescription(String description) {
            possibleItem.description = description;
            return this;
        }


        public Builder setAge(int age) {
            possibleItem.age = age;
            return this;
        }

        public Builder setBase64Image(List<String> base64Image) {
            possibleItem.base64Images = base64Image;
            return this;
        }


        public Builder setPart(List<Part> part) {
            possibleItem.parts = part;
            return this;
        }

        public Builder setImageBytes(List<byte[]> imageBytes) {
            possibleItem.imageBytes = imageBytes;
            return this;
        }


        @Override
        public PossibleItem build() {
            return possibleItem;
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public List<String> getBase64Image() {
        return base64Images;
    }

    public void setBase64Image(List<String> base64Image) {
        this.base64Images = base64Image;
    }


    @Override
    public String toString() {
        return "PossibleItem{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", age=" + age +
                ", base64Image='" + base64Images + '\'' +
                '}';
    }
}
