import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/title_edit_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'translation_model.dart';
export 'translation_model.dart';

class TranslationWidget extends StatefulWidget {
  const TranslationWidget({Key? key}) : super(key: key);

  @override
  _TranslationWidgetState createState() => _TranslationWidgetState();
}

class _TranslationWidgetState extends State<TranslationWidget> {
  late TranslationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TranslationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'ipj9vbfx' /* Page Title */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AuthUserStreamWidget(
                    builder: (context) => Container(
                      width: 120.0,
                      height: 120.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        valueOrDefault<String>(
                          currentUserPhoto,
                          'https://firebasestorage.googleapis.com/v0/b/demopro-4413c.appspot.com/o/users%2FODmKa9JmxNb6hchsFVQH6xzmjKF3%2Fuploads%2F1689193983372000.mp4?alt=media&token=29737cc0-008b-47d6-9270-5c505d938ab3',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        'nlkvhjvc' /* English */,
                      ),
                      FFLocalizations.of(context).getText(
                        '4stb6ai5' /* Kannada */,
                      ),
                      FFLocalizations.of(context).getText(
                        'xii53bn6' /* Arabic */,
                      )
                    ],
                    onChanged: (val) async {
                      setState(() => _model.dropDownValue = val);
                      setState(() {
                        _model.translation = () {
                          if (_model.dropDownValue == 'English') {
                            return 'en';
                          } else if (_model.dropDownValue == 'Kannada') {
                            return 'kn';
                          } else {
                            return 'ar';
                          }
                        }();
                      });
                    },
                    width: 300.0,
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: FFLocalizations.of(context).getText(
                      'gs6m3osx' /* Please select... */,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: false,
                  ),
                  StreamBuilder<List<CousecontentRecord>>(
                    stream: queryCousecontentRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<CousecontentRecord> listViewCousecontentRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewCousecontentRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewCousecontentRecord =
                              listViewCousecontentRecordList[listViewIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: Text(
                                  () {
                                    if (_model.translation == 'en') {
                                      return listViewCousecontentRecord
                                          .translated2.en;
                                    } else if (_model.translation == 'kn') {
                                      return listViewCousecontentRecord
                                          .translated2.kn;
                                    } else {
                                      return listViewCousecontentRecord
                                          .translated2.ar;
                                    }
                                  }(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Text(
                                () {
                                  if (_model.translation == 'en') {
                                    return listViewCousecontentRecord
                                        .translated.en;
                                  } else if (_model.translation == 'kn') {
                                    return listViewCousecontentRecord
                                        .translated.kn;
                                  } else {
                                    return listViewCousecontentRecord
                                        .translated.ar;
                                  }
                                }(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).accent4,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: Text(
                                  FFLocalizations.of(context).getVariableText(
                                    enText: listViewCousecontentRecord
                                        .translated2.en,
                                    arText: listViewCousecontentRecord
                                        .translated2.ar,
                                    knText: listViewCousecontentRecord
                                        .translated2.kn,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getVariableText(
                                  enText:
                                      listViewCousecontentRecord.translated.en,
                                  arText:
                                      listViewCousecontentRecord.translated.ar,
                                  knText:
                                      listViewCousecontentRecord.translated.kn,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).accent4,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: TitleEditWidget(
                                            reff: listViewCousecontentRecord
                                                .reference,
                                            iniTitle: () {
                                              if (FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'en') {
                                                return listViewCousecontentRecord
                                                    .titleManualTranslated.en;
                                              } else if (FFLocalizations.of(
                                                          context)
                                                      .languageCode ==
                                                  'ar') {
                                                return listViewCousecontentRecord
                                                    .titleManualTranslated.ar;
                                              } else {
                                                return listViewCousecontentRecord
                                                    .titleManualTranslated.kn;
                                              }
                                            }(),
                                            language: () {
                                              if (FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'en') {
                                                return 'en';
                                              } else if (FFLocalizations.of(
                                                          context)
                                                      .languageCode ==
                                                  'ar') {
                                                return 'ar';
                                              } else {
                                                return 'kn';
                                              }
                                            }(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Text(
                                  FFLocalizations.of(context).getVariableText(
                                    enText: listViewCousecontentRecord
                                                    .titleManualTranslated.en !=
                                                null &&
                                            listViewCousecontentRecord
                                                    .titleManualTranslated.en !=
                                                ''
                                        ? listViewCousecontentRecord
                                            .titleManualTranslated.en
                                        : listViewCousecontentRecord
                                            .translated2.en,
                                    arText: listViewCousecontentRecord
                                                    .titleManualTranslated.ar !=
                                                null &&
                                            listViewCousecontentRecord
                                                    .titleManualTranslated.ar !=
                                                ''
                                        ? listViewCousecontentRecord
                                            .titleManualTranslated.ar
                                        : listViewCousecontentRecord
                                            .translated2.ar,
                                    knText: listViewCousecontentRecord
                                                    .titleManualTranslated.kn !=
                                                null &&
                                            listViewCousecontentRecord
                                                    .titleManualTranslated.kn !=
                                                ''
                                        ? listViewCousecontentRecord
                                            .titleManualTranslated.kn
                                        : listViewCousecontentRecord
                                            .translated2.kn,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  FlutterFlowLanguageSelector(
                    width: 200.0,
                    backgroundColor: FlutterFlowTheme.of(context).tertiary,
                    borderColor: Colors.transparent,
                    dropdownIconColor: Colors.white,
                    borderRadius: 8.0,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 13.0,
                    ),
                    hideFlags: false,
                    flagSize: 24.0,
                    flagTextGap: 8.0,
                    currentLanguage: FFLocalizations.of(context).languageCode,
                    languages: FFLocalizations.languages(),
                    onChanged: (lang) => setAppLanguage(context, lang),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
