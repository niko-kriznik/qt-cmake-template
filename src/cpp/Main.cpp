#include "GUI/MainWindow.hpp"

#include <QApplication>

int main(int argc_, char* argv_[])
{
    QApplication qtApp(argc_, argv_);

    MainWindow window;
    window.show();

    return QApplication::exec();
}
