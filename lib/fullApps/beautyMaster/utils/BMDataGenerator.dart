import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/beautyMaster/models/BMAppointmentModel.dart';
import 'package:access_maketicket/fullApps/beautyMaster/models/BMCommentModel.dart';
import 'package:access_maketicket/fullApps/beautyMaster/models/BMCommonCardModel.dart';
import 'package:access_maketicket/fullApps/beautyMaster/models/BMDashboardModel.dart';
import 'package:access_maketicket/fullApps/beautyMaster/models/BMMasterModel.dart';
import 'package:access_maketicket/fullApps/beautyMaster/models/BMMessageModel.dart';
import 'package:access_maketicket/fullApps/beautyMaster/models/BMServiceListModel.dart';
import 'package:access_maketicket/fullApps/beautyMaster/models/BMShoppingModel.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

List<WalkThroughModelClass> getWalkThroughList() {
  List<WalkThroughModelClass> list = [];

  list.add(WalkThroughModelClass(image: 'images/beauty_master/model_one.jpg', title: 'Book a visit easy & fast', subTitle: 'Find the best beauty salon in your local and book a dream visit.'));
  list.add(WalkThroughModelClass(
      image: 'images/beauty_master/model_two.jpg', title: 'Online Services Booking', subTitle: 'For when visiting the shop or salon is not an option, experience beauty in new way.'));
  list.add(WalkThroughModelClass(
      image: 'images/beauty_master/model_three.jpg', title: 'Book anytime, anywhere', subTitle: 'Access calenders, services, and reviews wuth the freedom to book as you please.'));

  return list;
}

List<BMDashboardModel> getDashboardList() {
  List<BMDashboardModel> list = [];

  list.add(BMDashboardModel(selectedIcon: 'images/beauty_master/home.png', unSelectedIcon: 'images/beauty_master/house.png'));
  list.add(BMDashboardModel(selectedIcon: 'images/beauty_master/magnifier.png', unSelectedIcon: 'images/beauty_master/search.png'));
  list.add(BMDashboardModel(selectedIcon: 'images/beauty_master/calendar_selected.png', unSelectedIcon: 'images/beauty_master/calendar.png'));
  list.add(BMDashboardModel(selectedIcon: 'images/beauty_master/chat_selected.png', unSelectedIcon: 'images/beauty_master/chat.png'));
  list.add(BMDashboardModel(selectedIcon: 'images/beauty_master/more_selected.png', unSelectedIcon: 'images/beauty_master/more.png'));

  return list;
}

List<BMMasterModel> getMyMastersList() {
  List<BMMasterModel> list = [];

  list.add(BMMasterModel(image: '$BaseUrl/images/beauty_master/face_two.jpg', name: 'Hannah Benson'));
  list.add(BMMasterModel(image: '$BaseUrl/images/beauty_master/face_one.png', name: 'Maurice Reynolds'));
  list.add(BMMasterModel(image: '$BaseUrl/images/beauty_master/model_three.jpg', name: 'Hannah Benson'));

  return list;
}

List<BMMasterModel> getTopServicesHomeList() {
  List<BMMasterModel> list = [];

  list.add(BMMasterModel(image: '$BaseUrl/images/beauty_master/salon.png', name: 'Hair Salon'));
  list.add(BMMasterModel(image: '$BaseUrl/images/beauty_master/nail-polish.png', name: 'Nail Salon'));
  list.add(BMMasterModel(image: '$BaseUrl/images/beauty_master/makeup.png', name: 'Beauty Salon'));
  list.add(BMMasterModel(image: '$BaseUrl/images/beauty_master/makeup_kit.png', name: 'Beauty Salon'));

  return list;
}

List<BMCommonCardModel> getSpecialOffersList() {
  List<BMCommonCardModel> list = [];

  list.add(BMCommonCardModel(
    title: 'Fly Trim Hair Studio',
    image: '$BaseUrl/images/beauty_master/salon_one.jpg',
    saveTag: true,
    subtitle: '131-18 Merrick Blvd, Jamaica,Ny 11434',
    rating: '5.0',
    comments: '240',
    distance: '0.5 mil',
    liked: true,
  ));
  list.add(BMCommonCardModel(
    title: 'Paul Cuts',
    image: '$BaseUrl/images/beauty_master/salon_two.jpg',
    saveTag: true,
    subtitle: '131-18 Merrick Blvd, Jamaica,Ny 11434',
    rating: '4.9',
    comments: '192 reviews',
    distance: '0.7 mil',
    liked: false,
  ));
  list.add(BMCommonCardModel(
    title: 'Bio Pinky Nail Salon',
    image: '$BaseUrl/images/beauty_master/salon_four.jpg',
    saveTag: true,
    subtitle: '1159w Madison street, 1, Chicago',
    rating: '5.0',
    comments: '240',
    distance: '0.5 mil',
    liked: true,
  ));
  list.add(BMCommonCardModel(
    title: 'Savanna',
    image: '$BaseUrl/images/beauty_master/salon_three.jpg',
    saveTag: true,
    subtitle: '2701 Black Rd, Joliet, II, 60435',
    rating: '4.8',
    comments: '1.2k reviews',
    distance: '0.5 mil',
    liked: false,
  ));

  list.shuffle();

  return list;
}

List<BMCommonCardModel> getFavList() {
  List<BMCommonCardModel> list = [];

  list.add(BMCommonCardModel(
    title: 'Fly Trim Hair Studio',
    image: '$BaseUrl/images/beauty_master/salon_one.jpg',
    saveTag: false,
    subtitle: '131-18 Merrick Blvd, Jamaica,Ny 11434',
    rating: '5.0',
    comments: '240',
    distance: '0.5 mil',
    liked: true,
  ));
  list.add(BMCommonCardModel(
    title: 'Paul Cuts',
    image: '$BaseUrl/images/beauty_master/salon_two.jpg',
    saveTag: false,
    subtitle: '131-18 Merrick Blvd, Jamaica,Ny 11434',
    rating: '4.9',
    comments: '192 reviews',
    distance: '0.7 mil',
    liked: true,
  ));
  list.add(BMCommonCardModel(
    title: 'Bio Pinky Nail Salon',
    image: '$BaseUrl/images/beauty_master/salon_four.jpg',
    saveTag: false,
    subtitle: '1159w Madison street, 1, Chicago',
    rating: '5.0',
    comments: '240',
    distance: '0.5 mil',
    liked: true,
  ));
  list.add(BMCommonCardModel(
    title: 'Savanna',
    image: '$BaseUrl/images/beauty_master/salon_three.jpg',
    saveTag: false,
    subtitle: '2701 Black Rd, Joliet, II, 60435',
    rating: '4.8',
    comments: '1.2k reviews',
    distance: '0.5 mil',
    liked: true,
  ));

  list.shuffle();

  return list;
}

List<BMCommonCardModel> getRecommendedList() {
  List<BMCommonCardModel> list = [];

  list.add(BMCommonCardModel(
    title: 'Savanna',
    image: '$BaseUrl/images/beauty_master/salon_three.jpg',
    saveTag: false,
    subtitle: '2701 Black Rd, Joliet, II, 60435',
    rating: '4.8',
    comments: '1.2k',
    distance: '0.5 mil',
    liked: false,
    likes: '124',
  ));
  list.add(BMCommonCardModel(
    title: 'Bio Pinky Nail Salon',
    image: '$BaseUrl/images/beauty_master/salon_four.jpg',
    saveTag: false,
    subtitle: '1159w Madison street, 1, Chicago',
    rating: '5.0',
    comments: '240',
    distance: '0.5 mil',
    liked: true,
    likes: '23',
  ));

  list.add(BMCommonCardModel(
    title: 'Fly Trim Hair Studio',
    image: '$BaseUrl/images/beauty_master/salon_one.jpg',
    saveTag: false,
    subtitle: '131-18 Merrick Blvd, Jamaica,Ny 11434',
    rating: '5.0',
    comments: '240',
    distance: '0.5 mil',
    liked: true,
    likes: '258',
  ));
  list.add(BMCommonCardModel(
    title: 'Paul Cuts',
    image: '$BaseUrl/images/beauty_master/salon_two.jpg',
    saveTag: false,
    subtitle: '131-18 Merrick Blvd, Jamaica,Ny 11434',
    rating: '4.9',
    comments: '192',
    distance: '0.7 mil',
    liked: false,
    likes: '501',
  ));

  return list;
}

List<BMServiceListModel> getPopularServiceList() {
  List<BMServiceListModel> list = [];

  list.add(BMServiceListModel(name: 'Men\'s Hair cut', cost: '\$50.00', time: '1h'));
  list.add(BMServiceListModel(name: 'Men\'s Hair cut with beard', cost: '\$45.00', time: '30min'));
  list.add(BMServiceListModel(name: 'Glow Me Color', cost: '\$30.00', time: '1h'));

  return list;
}

List<BMServiceListModel> getOtherServiceList() {
  List<BMServiceListModel> list = [];

  list.add(BMServiceListModel(name: 'Early Bird Special(text to schedule)', cost: '\$25.00', time: '35min'));
  list.add(BMServiceListModel(name: 'Men\'s Hair cut with beard', cost: '\$18.00', time: '30min'));
  list.add(BMServiceListModel(name: 'Kid\'s Haircut(12 & under)', cost: '\$12.00', time: '45min'));
  list.add(BMServiceListModel(name: 'Full VIP Service', cost: '\$20.00', time: '30min'));
  list.add(BMServiceListModel(name: 'Men\'s Hair cut', cost: '\$50.00', time: '15min'));
  list.add(BMServiceListModel(name: 'Edge w/Beard trim beard', cost: '\$5.00', time: '30min'));

  return list;
}

List<BMCommentModel> getCommentsList() {
  List<BMCommentModel> list = [];

  list.add(BMCommentModel(image: '$BaseUrl/images/beauty_master/face_one.png', likes: '4', time: '3m', name: 'Donald Walters', message: 'Nice work, bro!', isSubComment: false, isLiked: false));
  list.add(
      BMCommentModel(image: '$BaseUrl/images/beauty_master/face_two.jpg', likes: '2', time: '3m', name: 'Roxie Love', message: 'How many time for this style?', isSubComment: false, isLiked: true));
  list.add(BMCommentModel(image: '$BaseUrl/images/beauty_master/face_one.png', likes: '2', time: '3m', name: 'Cotherine Guzman', message: '45 minutes. maybe.', isSubComment: true, isLiked: false));
  list.add(BMCommentModel(image: '$BaseUrl/images/beauty_master/face_two.jpg', likes: '4', time: '20m', name: 'Nwaye Akachi', message: 'Good work!', isSubComment: false, isLiked: false));
  list.add(
      BMCommentModel(image: '$BaseUrl/images/beauty_master/face_one.png', likes: '4', time: '2d', name: 'Cvita Dolwschall', message: 'Suite with me, let\'s go!', isSubComment: false, isLiked: false));

  return list;
}

List<BMAppointmentModel> getAppointments() {
  List<BMAppointmentModel> list = [];

  list.add(BMAppointmentModel(
    image: '$BaseUrl/images/beauty_master/face_one.png',
    time: '9:30 PM - 10.30 PM (1h)',
    isSelected: true,
    product: '1 product',
    salonName: 'PACHA\'S Luciano',
    service: 'Men\'s Hair cut',
  ));

  return list;
}

List<BMAppointmentModel> getMoreAppointmentsList() {
  List<BMAppointmentModel> list = [];

  list.add(BMAppointmentModel(
    image: '$BaseUrl/images/beauty_master/face_one.png',
    time: '9:30 PM - 10.30 PM (1h)',
    isSelected: false,
    product: '1 product',
    salonName: 'PACHA\'S Luciano',
    service: 'Men\'s Hair cut',
  ));
  list.add(BMAppointmentModel(
    image: '$BaseUrl/images/beauty_master/face_two.jpg',
    time: '14:30 PM - 15.30 PM',
    isSelected: false,
    product: '1 product',
    salonName: 'Uncle will Da Barber',
    service: 'Hair cut + Deluxe Beard/ Facial Service',
  ));

  return list;
}

List<BMMessageModel> getActiveList() {
  List<BMMessageModel> list = [];

  list.add(BMMessageModel(image: '$BaseUrl/images/beauty_master/face_two.jpg', name: 'Hannah Benson', message: 'Hello!', isActive: true, lastSeen: ''));
  list.add(BMMessageModel(image: '$BaseUrl/images/beauty_master/face_two.jpg', name: 'Harry Gardner', message: 'How can I help you?', isActive: true, lastSeen: ''));

  return list;
}

List<BMMessageModel> getMessageList() {
  List<BMMessageModel> list = [];

  list.add(BMMessageModel(image: '$BaseUrl/images/beauty_master/face_two.jpg', name: 'Hannah Benson', message: 'Hello!', isActive: true, lastSeen: ''));
  list.add(BMMessageModel(
      image: '$BaseUrl/images/beauty_master/face_one.png', name: 'Victor Pocheco', message: 'Do you want to confirm yor appointment?', isActive: false, lastSeen: 'today , at 11:30 am'));
  list.add(BMMessageModel(image: '$BaseUrl/images/beauty_master/model_three.jpg', name: 'Harry Gardner', message: 'How can I help you?', isActive: true, lastSeen: ''));

  return list;
}

List<BMShoppingModel> getProductList() {
  List<BMShoppingModel> list = [];

  list.add(BMShoppingModel(
    name: 'Intensive Theraphy Choco Gotas Shine',
    image: '$BaseUrl/images/beauty_master/product_one.jpg',
    cost: '\$35.00',
    isAdded: true,
    items: 1,
    mrp: '\$40.29',
    rate: '4.9',
    views: '(135)',
  ));
  list.add(BMShoppingModel(
    name: 'Kiwi Skin boosterz',
    image: '$BaseUrl/images/beauty_master/product_two.png',
    cost: '\$29.99',
    isAdded: false,
    items: 1,
    mrp: '\$35.00',
    rate: '4.9',
    views: '(240)',
  ));
  list.add(BMShoppingModel(
    name: 'Intensive Theraphy Choco Gotas Shine',
    image: '$BaseUrl/images/beauty_master/product_three.jpg',
    cost: '\$35.00',
    isAdded: false,
    items: 1,
    mrp: '\$40.29',
    rate: '4.9',
    views: '(135)',
  ));

  return list;
}
