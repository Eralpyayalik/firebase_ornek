# Flutter Firebase Örneği

Flutter'da Firebase Authentication ve Firestore kullanımını gösteren küçük bir örnek. E-posta ve parola ile kayıt olunuyor, kullanıcı adı Firestore'daki `Users` koleksiyonuna yazılıyor. Giriş yaptıktan sonra hesap e-postası ana ekranda gösteriliyor.

## Dosyalar

- `lib/screens/`: giriş, kayıt ve ana ekran.
- `lib/services/auth_service.dart`: hesap oluşturma ve kullanıcı bilgisini kaydetme.
- `lib/widgets/user_widget.dart`: oturum açmış kullanıcının bilgisini gösteren bileşen.

Kendi Firebase projenle denemek için Authentication'da e-posta/parola girişini açman, Firestore'u hazırlaman ve Firebase yapılandırmasını kendi projenle eşleştirmen gerekiyor.

Bu, eski bir deneme projesi. Mevcut `main.dart` ekranları doğrudan `lib/` altında arıyor; çalıştırmadan önce bu importları `lib/screens/` konumuna göre düzeltmek gerekiyor.

Bağımlılıklar `flutter pub get` ile kurulabilir.
