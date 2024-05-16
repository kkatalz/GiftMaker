package entity;

public class Category {
    private int id;
    private String name;

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


    public static class Builder implements CustomBuilder<Category> {
        Category category = new Category();

        public Builder setCategoryId(int number) {
            category.id = number;
            return this;
        }

        public Builder setName(String name) {
            category.name = name;
            return this;
        }

        @Override
        public Category build() {
            return category;
        }
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }

}
