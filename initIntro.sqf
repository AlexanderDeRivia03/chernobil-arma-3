[] spawn {
    if (!hasInterface) exitWith {};
	titleText ["", "BLACK IN", 7];
    playSound "ambience";
 sleep 1.4;
    [
        ["Afueras de Prypiat", 2, 1, 2],
        ["5:10AM", 2, 1, 2]
    ] spawn BIS_fnc_EXP_camp_SITREP;



    _cam = "camera" camCreate [13315, 24386.7, 3];
    _cam cameraEffect ["internal", "BACK"];
    showCinemaBorder true;
    _cam camSetFOV 0.7;
    _cam setDir 61;
    _cam camCommit 0;
    sleep 15;

    _cam camSetPos [13607.1, 24419, 5];
    _cam setDir 278;
    _cam camCommit 0;
    sleep 5;

    _cam camSetPos [13640.7, 24430, 5];
    _cam setDir 256;
    _cam camCommit 0;
    sleep 4;

    // Cambio instantáneo y simple
    _cam cameraEffect ["terminate", "BACK"];
    camDestroy _cam;

    _cam = "camera" camCreate position criatura1;
    _cam camSetFOV 0.5;
    _cam camSetTarget (position criatura1 vectorAdd (vectorDir criatura1 vectorMultiply 10));
    _cam cameraEffect ["internal", "BACK"];
    _cam camCommit 0;
    showCinemaBorder true;

    while {alive criatura1} do {
        _cam camSetPos position criatura1;
        _cam camSetTarget (position criatura1 vectorAdd (vectorDir criatura1 vectorMultiply 10));
        _cam camCommit 0.1;
        sleep 0.1;
    };

    _cam cameraEffect ["terminate", "BACK"];
    camDestroy _cam;
    showCinemaBorder false;
};
