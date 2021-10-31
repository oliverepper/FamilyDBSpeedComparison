//
//  TestRunnerCpp.cpp
//  FamilyDBSpeedComparison
//
//  Created by Oliver Epper on 31.10.21.
//

#include <iostream>
#include <vector>

using namespace std;

class Person {
public:
    Person(string name, int age) : m_name{name}, m_age{age} {}
    bool operator==(const Person& other) {
        return m_name == other.m_name;
    }
    friend ostream& operator<<(ostream& os, const Person& person);
private:
    string m_name;
    int m_age;
};

ostream& operator<<(ostream& os, const Person& person) {
    os << "My name is " << person.m_name << " and I am " << person.m_age << " years old.\n";
    return os;
}

class Family {
public:
    Family(string name) : m_name{name}, m_members{ vector<Person>{} } {}
    void add_person(const Person& person) {
        m_members.push_back(person);
    }
    void remove_person(const Person& person) {
        m_members.erase(find(m_members.begin(), m_members.end(), person), m_members.end());
    }
    friend ostream& operator<<(ostream& os, const Family& family);
    size_t size() {
        return m_members.size();
    }
private:
    string m_name;
    vector<Person> m_members;
};

ostream& operator<<(ostream& os, const Family& family) {
    for (const auto& person: family.m_members) {
        os << person;
    }
    return os;
}

extern "C" void runCpp(void) {
    auto family = Family{"Test"};
    for (int i=0; i<1000000; i++) {
        family.add_person(Person{"Test Person", i});
    }
    cout << "Family size: " << family.size() << endl;
}
