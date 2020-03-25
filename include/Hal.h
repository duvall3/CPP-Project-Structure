#ifndef HAL_H
#define HAL_H

class Hal{
  public:
    Hal();               // Constructor
    ~Hal();              // Destructor
    void get_version();
  private:
    const int version = 9000;
};

#endif  /* HAL_H */
