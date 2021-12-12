package api.category.create;

public class Category {
	
	String goodSmlclsCode;
	String categoryName;
	public Category() {
		super();
	}
	public Category(String goodSmlclsCode, String categoryName) {
		super();
		this.goodSmlclsCode = goodSmlclsCode;
		this.categoryName = categoryName;
	}
	public String getGoodSmlclsCode() {
		return goodSmlclsCode;
	}
	public void setGoodSmlclsCode(String goodSmlclsCode) {
		this.goodSmlclsCode = goodSmlclsCode;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	@Override
	public String toString() {
		return "Category [goodSmlclsCode=" + goodSmlclsCode + ", categoryName=" + categoryName + "]";
	}
	
	

}
