/* Note that Pizza is immutable and that parameter values are all in a single location. Because the Builder's setter methods return the Builder object they are able to be chained.

   Pizza will have a  subclass PizzaBuilder
   Pizza will have a  ctor that takes a  PizzaBuilder
   */

class Pizza
{
private:
    int size = 10;
    bool cheese = false;
    bool peproni = false;
    bool bacon = false;

public:
    class PizzaBuilder
    {
    public:
        int size = 10;
        bool cheese = false;
        bool peproni = false;
        bool bacon = false;

    public:
        PizzaBuilder(Pizza &pz);
        PizaBuilder &size(int sz);
        PizaBuilder &bacon(bool);
        PizaBuilder &cheese(bool );
        PizaBuilder &peproni(bool);
        unique_ptr<Pizza> build()
        {
            return new Pizza(this);
        }

    }

public:
    Pizza(const builder& bd)
    {
      size=bd.size;
      
    }
}


   
