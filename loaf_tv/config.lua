Config = {}

Config['URL'] = 'https://www.youtube.com/embed/%s?autoplay=1&controls=1&disablekb=1&fs=0&rel=0&showinfo=0&iv_load_policy=3&start=%s'
-- Config['URL'] = 'https://www.youtube.com/watch?v=%s&t=%s' -- use this if you want to be able to play copyrighted stuff. please note that ads will pop up every now and again, and full screen doesn't work
Config['API'] = {
    ['URL'] = 'https://www.googleapis.com/youtube/v3/videos?id=%s&part=contentDetails&key=%s',
    ['Key'] = ''
}
Config['DurationCheck'] = false -- this will automatically delete the browser (good for ram i guess?) once the video has finished (REQUIRES YOU TO ADD AN API KEY!!!!!)

Config['Objects'] = {
    {
        ['Object'] = 'prop_tv_flat_michael',
        ['Scale'] = 0.085,
        ['Offset'] = vec3(-1.475, -0.075, 1.0),
        ['Distance'] = 7.5,
    },
}

Strings = {
    ['VideoHelp'] = 'Wpisz ~b~/tv ~y~youtube id~s~ aby odtworzyc film.\nPrzyklad: ~b~/tv ~y~3hqjseATp4g~s~',
    ['VolumeHelp'] = 'Wpisz ~b~/volume ~y~(0-10)~s~ aby zmienic glosnosc filmu.\nPrzyklad: ~b~/volume ~y~5~s~\n\nWpisz ~b~/tv ~y~youtube id~s~ aby zmienic film.\nPrzyklad: ~b~/tv ~y~3hqjseATp4g~s~\n\nNapisz ~b~/destroy~s~ aby wylaczyc film\n\n~INPUT_CONTEXT~ aby zsynchronizowac film.',
}