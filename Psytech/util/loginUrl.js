exports.getLoginUrl = (email) => {
    let baseUrl = process.env.FRONTEND_URL || 'https://vaulttech.psicodx.com/';
    baseUrl = baseUrl.endsWith('/') ? baseUrl : baseUrl + '/';
    const loginUrl = baseUrl + 'login?email=' + encodeURIComponent(email);
    return loginUrl;
}