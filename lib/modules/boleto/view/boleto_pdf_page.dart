import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_api/modules/boleto/controllers/pdf_boleto_controller.dart';
import 'package:my_api/modules/boleto/models/boleto_model.dart';
import 'package:my_api/modules/boleto/models/pdf_boleto_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PdfBoletoPage extends StatefulWidget {
  final BoletoModel boletoModel;

  const PdfBoletoPage({Key? key, required this.boletoModel}) : super(key: key);

  @override
  State<PdfBoletoPage> createState() => _PdfBoletoPageState();
}

class _PdfBoletoPageState extends State<PdfBoletoPage> {
  final controller = Modular.get<PdfBoletoController>();

  @override
  void initState() {
    super.initState();
    controller.fetchPdfBoleto(
        widget.boletoModel.cnpj_cpf, widget.boletoModel.datadovencimento);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
      animation: controller,
      builder: (context, widget) {
        if (controller.pdfboleto.isEmpty) return const SizedBox.shrink();
        return PDFScreen(pdfBoletoModel: controller.pdfboleto.first);
      },
    ));
  }
}

class PDFScreen extends StatefulWidget {
  final PdfBoletoModel pdfBoletoModel;

  const PDFScreen({Key? key, required this.pdfBoletoModel}) : super(key: key);

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arquivo PDF"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SfPdfViewer.network(
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
      ),
    );
  }
}








// pelo outro plugin 
// class PDFScreen extends StatefulWidget {
//   final PdfBoletoModel pdfBoletoModel;

//   PDFScreen({Key? key, required this.pdfBoletoModel}) : super(key: key);

//   _PDFScreenState createState() => _PDFScreenState();
// }

// class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
//   final Completer<PDFViewController> _controller =
//       Completer<PDFViewController>();
//   int? pages = 0;
//   int? currentPage = 0;
//   bool isReady = false;
//   String errorMessage = '';

//   @override
//   //
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Document"),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.share),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Stack(
//         children: <Widget>[
//           PDFView(
//             pdfData: widget.pdfBoletoModel.arquivopdf,
//             enableSwipe: true,
//             swipeHorizontal: true,
//             autoSpacing: false,
//             pageFling: true,
//             pageSnap: true,
//             defaultPage: currentPage!,
//             fitPolicy: FitPolicy.BOTH,
//             preventLinkNavigation: false,
//             onRender: (_pages) {
//               setState(() {
//                 pages = _pages;
//                 isReady = true;
//               });
//             },
//             onError: (error) {
//               setState(() {
//                 errorMessage = error.toString();
//               });
//               print(error.toString());
//             },
//             onPageError: (page, error) {
//               setState(() {
//                 errorMessage = '$page: ${error.toString()}';
//               });
//               print('$page: ${error.toString()}');
//             },
//             onViewCreated: (PDFViewController pdfViewController) {
//               _controller.complete(pdfViewController);
//             },
//             onLinkHandler: (String? uri) {
//               print('goto uri: $uri');
//             },
//             onPageChanged: (int? page, int? total) {
//               print('page change: $page/$total');
//               setState(() {
//                 currentPage = page;
//               });
//             },
//           ),
//           errorMessage.isEmpty
//               ? !isReady
//                   ? Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : Container()
//               : Center(
//                   child: Text(errorMessage),
//                 )
//         ],
//       ),
//       floatingActionButton: FutureBuilder<PDFViewController>(
//         future: _controller.future,
//         builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
//           if (snapshot.hasData) {
//             return FloatingActionButton.extended(
//               label: Text("Go to ${pages! ~/ 2}"),
//               onPressed: () async {
//                 await snapshot.data!.setPage(pages! ~/ 2);
//               },
//             );
//           }

//           return Container();
//         },
//       ),
//     );
//   }
// }
