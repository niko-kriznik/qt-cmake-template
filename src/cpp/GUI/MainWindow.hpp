#ifndef QTCMAKEEXAMPLE_MAINWINDOW_HPP
#define QTCMAKEEXAMPLE_MAINWINDOW_HPP

#include <QMainWindow>
#include <QPixmap>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget* parent_ = nullptr);
    ~MainWindow();

private slots:

    void on_button_clicked();

private:
    Ui::MainWindow* m_ui;
    QPixmap m_image;
};

#endif // QTCMAKEEXAMPLE_MAINWINDOW_HPP
