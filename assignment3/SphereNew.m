function f = SphereNew(E)
    Vk = 0.5;
    Ae = 12;
    Be = 6;
    De = 4;
    hkl1 = 18;
    hkl2 = 6;

    A = sum((E/(1 - Vk)^2)*(hkl1 - hkl2));
    B = sum(E/(1 - Vk)^2*(hkl1^2 - hkl2^2));
    D = sum(E/(1 - Vk)^2*(hkl1^3 - hkl2^3));

    f = sqrt((A/Ae - 1)^2 + (B/Be - 1)^2 + (D/De - 1)^2);
    % f = sum(x.^2)
