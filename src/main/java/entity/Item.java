package entity;

import javax.servlet.http.Part;
import java.io.*;
import java.math.BigDecimal;

public class Item {
    private Integer id;
    private Category category;
    private String name;
    private BigDecimal price;
    private String description;
    private int amount;
    private int age;
    private String base64Image; // might be the proper format to display on the page
    private File imageForInsertion; // should be used in insertion to the table
    private Part part;

    public String getBase64Image() {
        return this.base64Image;
    }


    public static class Builder implements CustomBuilder<Item> {
        Item item = new Item();

        public Builder setId(Integer id) {
            item.id = id;
            return this;
        }

        public Builder setCategory(Category category) {
            item.category = category;
            return this;
        }

        public Builder setName(String name) {
            item.name = name;
            return this;
        }

        public Builder setPrice(BigDecimal price) {
            item.price = price;
            return this;
        }

        public Builder setDescription(String description) {
            item.description = description;
            return this;
        }

        public Builder setAmount(int amount) {
            item.amount = amount;
            return this;
        }

        public Builder setAage(int age) {
            item.age = age;
            return this;
        }

        public Builder setBase64Image(String base64Image) {
            item.base64Image = base64Image;
            return this;
        }

        public Builder setImageForInsertion(File imageForInsertion) {
            item.imageForInsertion = imageForInsertion;
            return this;
        }

        public Builder setPart(Part part) {
            item.part = part;
            return this;
        }


        @Override
        public Item build() {
            return item;
        }
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
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

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Part getPart() {
        return part;
    }

    public void setPart(Part part) {
        this.part = part;
    }

    @Override
    public String toString() {
        return "Item{" +
                "id=" + id +
                ", category=" + category +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", amount=" + amount +
                ", age=" + age +
                ", base64Image='" + base64Image + '\'' +
                ", imageForInsertion=" + imageForInsertion +
                '}';
    }

    public byte[] readFile() {
        ByteArrayOutputStream bos = null;
        try {
            FileInputStream fis = new FileInputStream(this.imageForInsertion);
            byte[] buffer = new byte[1024];
            bos = new ByteArrayOutputStream();

            for (int len; (len = fis.read(buffer)) != -1;) {
                bos.write(buffer, 0, len);
            }

        } catch (IOException e) {
            System.err.println(e.getMessage());
        }

        return bos != null ? bos.toByteArray() : null;
    }

}
