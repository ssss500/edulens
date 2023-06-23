class RoutesNames {
  static const String splash = '/splash';
  static const String welcomeScreen = '/welcomeScreen';
  static const String login = '$welcomeScreen/login';
  static const String register1 = '$welcomeScreen/register1';
  static const String register2 = '$register1/register2';
  static const String register3 = '$register2/register3';
  static const String registerUni1 = '$welcomeScreen/registerUni1';
  static const String registerUni2 = '$registerUni1/registerUni2';
  static const String registerUni3 = '$registerUni2/registerUni3';
  static const String home = '/home';
  static const notFoundRoutes = '/notFound';

  static const String packages = '/packages';
  static const String favourite = '/favourite';
  static const String message = '/message';
  static const String paidLecture = '/paidLecture';

  static String teacherProfileFromHome(id) => '$home/teacher/:$id';

  static String subject(id) => '$home/subject/:$id';

  static String teacherProfileFromSubjects({idSubject, idTeacher}) =>
      '${subject(idSubject)}/teacher/:$idTeacher';

  static String videoView = '/videoView';
  static String coursesFromHome = '/coursesFromHome';
  static String chooseTeacherForPackages = '/chooseTeacherForPackages';
  static String createAccountView = '/createAccountView';
  static String subjectView = '/subjectView';
  static String teacherView = '/teacherView';
  static String profileTeacherView = '/profileTeacherView';
  static String purchasedLecture ='/purchasedLecture';
  static String packageView = '/packageView';
  static String howWeAre = '/howWeAre';
  static String subjectTeacher = '/subjectTeacher';
  static String messageView = '/messageView';
  static String qMonthView = '/qMonthView';
  static String answerQuizMonthView= '/answerQuizMonthView';
  static String pdfView = '/pdfView';
  static String questionView = '/questionView';
  static String zoomImageView = '/oomImageView';
  static String answerQuizView = '/answerQuizView';
}
