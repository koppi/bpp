#ifndef PREFS_H
#define PREFS_H

#include <QDialog>
#include <QHash>
#include <QListWidget>
#include <QString>
#include <QVariant>

#include <QKeyEvent>
#include <QSettings>

#include "ui_prefs.h"

class Prefs : public QDialog, public Ui_Prefs {
  Q_OBJECT

public:
  Prefs(QSettings *settings, QWidget *parent = 0);
  ~Prefs();

  void accept();
  void activateGroupPage(QString group, int id);

  QVariant getValue(QString key) const;
  void setValue(QString key, QVariant value);

protected:
  void changeEvent(QEvent *e);

protected slots:
  void changeGroup(QListWidgetItem *current, QListWidgetItem *previous);
  void on_buttonOk_clicked();

  void guiOpenLastFileChanged(const bool);
  void guiWindowStateChanged(const bool);

  void fontFamilyChanged(const QString);
  void fontSizeChanged(const QString);

  void on_luaPathChanged();

  void on_povPreviewChanged();

  void on_povExecutableChanged();
  void on_povExecutableBrowse();

  void on_povExportDirChanged();
  void on_povExportDirBrowse();

  void on_scadExecutableChanged();
  void on_scadExecutableBrowse();

signals:
  void checkOpenLastFileChanged(const bool checked);
  void checkOpenLastWindowState(const bool checked);

  void fontChanged(const QString &family, uint size) const;

  void luaPathChanged(QString path) const;

  void povPreviewChanged(QString cmd) const;
  void povExecutableChanged(QString dir) const;
  void povExportDirChanged(QString dir) const;

  void scadExecutableChanged(QString dir) const;

private:
  void keyPressEvent(QKeyEvent *e);
  void updateGUI();
  void removeDefaultSettings();
  void setupPages();

private:
  QHash<QString, QList<QString>> _pages;
  bool invalidParameter;

  QSettings *_settings;
  QSettings::SettingsMap defaultmap;
};

#endif
