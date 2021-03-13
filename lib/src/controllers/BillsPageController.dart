import 'package:Brisacliente/src/models/plan.dart';
import 'package:Brisacliente/src/repositories/BillsRepository.dart';
import 'package:Brisacliente/src/repositories/PlansRepository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'BillsPageController.g.dart';

class BillsPageController extends _BillsPageControllerBase
    with _$BillsPageController {
  BillsPageController(String uid) {
    super._uid = uid;
    super._billsRepository = BillsRepository(uid);
    super._plansRepository = PlansRepository(uid);
  }
}

abstract class _BillsPageControllerBase with Store {
  String _uid;
  String address;
  BillsRepository _billsRepository;
  PlansRepository _plansRepository;
  PageController pageController;

  @observable
  List<Plan> plans;

  @observable
  List<Map<String, dynamic>> calendarBills;

  @observable
  int tabIndex;

  @action
  setTabIndex(int value) {
    tabIndex = value;
    pageController.jumpToPage(value);
  }

  @action
  getBills() async {
    this.plans = await _plansRepository.getPlans();
    this.address = await _plansRepository.getAddress();
    this.calendarBills = await _billsRepository.getCalendarBills();
    this.tabIndex = calendarBills.length - 1;
    pageController = PageController(initialPage: this.tabIndex);
  }

  getAddress() async {
    return await _plansRepository.getAddress();
  }
}
