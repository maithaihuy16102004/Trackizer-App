import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';

class UpcomingBillRow extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressed;

  const UpcomingBillRow({
    super.key,
    required this.onPressed,
    required this.sObj,
  });

  /// Helper: lấy viết tắt của tháng từ DateTime
  String _getMonthAbbreviation(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[date.month - 1];
  }

  @override
  Widget build(BuildContext context) {
    final DateTime? billDate = sObj["date"] is DateTime ? sObj["date"] : null;
    final String monthText =
        billDate != null ? _getMonthAbbreviation(billDate) : "--";
    final String dayText = billDate != null ? billDate.day.toString() : "--";

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 65,
          decoration: BoxDecoration(
            color: TColor.gray60.withOpacity(0.2),
            border: Border.all(color: TColor.border.withOpacity(0.15)),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              // --- Cột ngày/tháng ---
              Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: TColor.gray70.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      monthText,
                      style: TextStyle(
                        color: TColor.gray60,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        height: 1.0, // tránh overflow
                      ),
                    ),
                    Text(
                      dayText,
                      style: TextStyle(
                        color: TColor.gray30,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // --- Tên dịch vụ ---
              Expanded(
                child: Text(
                  sObj["name"] ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: TColor.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // --- Giá tiền ---
              Text(
                sObj["price"] != null ? "\$${sObj["price"]}" : "--",
                style: TextStyle(
                  color: TColor.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
