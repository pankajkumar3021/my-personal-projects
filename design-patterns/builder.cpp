class Pizza
{
public:
    Pizza(const builder &bd)
    {
    }

private:
    int size = 10;
    bool cheese = false;
    bool peproni = false;
    bool bacon = false;

public:
    class PizzaBuilder
    {
    private:
        int size = 10;
        bool cheese = false;
        bool peproni = false;
        bool bacon = false;

    public:
        PizzaBuilder(Pizza &pz);
        PizaBuilder &size(int sz);
        PizaBuilder &size(int sz);
        PizaBuilder &size(int sz);
        unique_ptr<Pizza> build()
        {
            return new Pizza(this);
        };

    }

    auto Pizza = Pizza