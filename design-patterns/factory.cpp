class Product;
class MyProduct:public Product
{

};

class Creator
{

	virtual Product* create(int product_id)=0;
};

class MyCreator
{

	virtual Product* create(int product_id)
	{
         if(product_id==MY_Product_Id)
		 return new MyProduct;
	}



};
